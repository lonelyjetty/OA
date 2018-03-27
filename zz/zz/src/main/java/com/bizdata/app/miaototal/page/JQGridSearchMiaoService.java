package com.bizdata.app.miaototal.page;

import com.bizdata.app.miaototal.controller.vo.SearchMiaoTotalVO;
import com.bizdata.commons.utils.JqGridPageVO;
import com.bizdata.commons.utils.JqGridSortVO;

public interface JQGridSearchMiaoService {
	JQGridResponse search(JqGridPageVO jqGridPageVO, JqGridSortVO jqGridSortVO, SearchMiaoTotalVO searchMiaoTotalVO);
}
