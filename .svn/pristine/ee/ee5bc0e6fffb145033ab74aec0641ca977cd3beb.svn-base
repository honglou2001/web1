package bean;

/**
 * 分页代码
 * 
 */
public class Pager {
	private int current;// 当前记录的位置
	private int size; // 数据总记录
	private int length;// 每页显示的记录条数
	private String url;// URL 调用Action里分页请求的URL
	private String pageHeader;// 导航条前文字

	public Pager(int offset, int size, int length, String url, String pageHeader) {
		this.current = offset;
		this.size = size;
		this.length = length;
		this.url = url;
		this.pageHeader = pageHeader;
	}

	public int getOffset() {
		return current;
	}

	public void setOffset(int offset) {
		this.current = offset;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPageHeader() {
		return pageHeader;
	}

	public void setPageHeader(String pageHeader) {
		this.pageHeader = pageHeader;
	}

	/**
	 * 返回分页导航条
	 * 
	 */

	public String getPageNavigation() {
		String pageNavigation = ""; 
		
		System.out.println(size);
		if (size > length) {
			String pref; // 前缀
			if (url.indexOf("?") > -1) {
			 
				pref = "&";
			} else {
				 
				pref = "?";
			}
			 
			if (pageHeader != null && pageHeader.length() > 0) {
				pageNavigation = pageHeader + " : ";
			}
			//  包含“<<”(第一页)和“<”(前一页)
			if (current > 0) {
				pageNavigation += "<a href='" + url + pref
						+ "current=0'>[首页]</a>\n" + "<a href='" + url + pref
						+ "current=" + (current - length) + "'>[<]</a>\n";
			}
			// 导航条中,排头的那一页的current值
			int startOffset;
			
			int radius = Constants.MAX_PAGE_INDEX / 2 * length;
			
			if (current < radius
					|| this.pageCount() <= Constants.MAX_PAGE_INDEX) {
				
				startOffset = 0;
			} else if (current < size - radius) {
				startOffset = current - radius;
			} else {
				startOffset = (size / length - Constants.MAX_PAGE_INDEX)
						* length;
			}
			for (int i = startOffset; i < size
					&& i < startOffset + Constants.MAX_PAGE_INDEX * length; i += length) {
				if (i == current) {
					// 当前页号,加粗显示
					pageNavigation += "<b>" + (i / length + 1) + "</b>\n";
				} else {
					
					pageNavigation += "<a href='" + url + pref + "current=" + i
							+ "'>" + (i / length + 1) + "</a>\n";
				}
			}
			//(下一页)和“>>”(最后一页)
			if (current < size - length) {
				pageNavigation += "<a href='" + url + pref + "current="
						+ (current + length) + "'>[>]</a>\n" + "<a href='"
						+ url + pref + "current=" + lastPageOffset()
						+ "'>[尾页]</a>\n";
			}
			
			return pageNavigation;
		}
		
		else {
			return "";
		}
	}

	/**
	 * 返回分页后的总页数
	 * 
	
	 */
	public int pageCount() {
		int pagecount = 0;
		if (size % length == 0) {
			pagecount = size / length;
		} else {
			pagecount = size / length + 1;
		}
		return pagecount;
	}

	/**
	 * 返回最后一页的起始记录位置
	
	 */
	public int lastPageOffset() {
		return size - lastPageSize();
	}

	/**
	 * 返回最后一页的记录数
	
	 */
	public int lastPageSize() {
		int lastpagesize = 0;
		if (size % length == 0) {
			lastpagesize = length;
		} else {
			lastpagesize = size % length;
		}
		return lastpagesize;
	}

}
