package com.bizdata.framework.shiro.redis;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.eis.AbstractSessionDAO;
import org.springframework.data.redis.core.RedisTemplate;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.TimeUnit;

/**
 * 使用Redis实现的sessionDao
 * <p>
 * Created by sdevil507 on 2017/8/26.
 */
@Slf4j
@Data
@EqualsAndHashCode(callSuper = true)
public class RedisCacheSessionDao extends AbstractSessionDAO {

    /**
     * session的超时时间
     */
    private long timeOut;

    private String keyPrefix = "shiro_session:";

    /**
     * redis操作模板
     */
    private RedisTemplate<String, Session> redisTemplate;

    public RedisCacheSessionDao(long timeOut) {
        this.timeOut = timeOut;
    }

    private String getKey(Serializable sessionId) {
        return keyPrefix + sessionId;
    }

    @Override
    protected Serializable doCreate(Session session) {
        Serializable sessionId = this.generateSessionId(session);
        this.assignSessionId(session, sessionId);
        redisTemplate.opsForValue().set(getKey(sessionId), session);
        return sessionId;
    }

    @Override
    protected Session doReadSession(Serializable sessionId) {
        if (null == sessionId) {
            log.error("session is null!");
            return null;
        }
        return redisTemplate.opsForValue().get(getKey(sessionId));
    }

    @Override
    public void update(Session session) throws UnknownSessionException {
        if (null == session || null == session.getId()) {
            log.error("session or session id is null");
            return;
        }
        redisTemplate.opsForValue().set(getKey(session.getId()), session, timeOut, TimeUnit.MINUTES);
    }

    @Override
    public void delete(Session session) {
        if (null == session || null == session.getId()) {
            log.error("session or session id is null");
            return;
        }
        redisTemplate.delete(getKey(session.getId()));
    }

    @Override
    public Collection<Session> getActiveSessions() {
        Set<Session> sessions = new HashSet<>();
        Set<byte[]> keys = redisTemplate.getConnectionFactory().getConnection().keys((this.keyPrefix + "*").getBytes());
        if (null != keys && keys.size() > 0) {
            for (byte[] key : keys) {
                sessions.add(redisTemplate.opsForValue().get(new String(key)));
            }
        }
        return sessions;
    }
}
