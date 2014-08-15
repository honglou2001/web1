package bean;

/**
 * ��ҳ����
 * 
 */
public class Pager {
	private int current;// ��ǰ��¼��λ��
	private int size; // �����ܼ�¼
	private int length;// ÿҳ��ʾ�ļ�¼����
	private String url;// URL ����Action���ҳ�����URL
	private String pageHeader;// ������ǰ����

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
	 * ���ط�ҳ������
	 * 
	 */

	public String getPageNavigation() {
		String pageNavigation = ""; 
		
		System.out.println(size);
		if (size > length) {
			String pref; // ǰ׺
			if (url.indexOf("?") > -1) {
			 
				pref = "&";
			} else {
				 
				pref = "?";
			}
			 
			if (pageHeader != null && pageHeader.length() > 0) {
				pageNavigation = pageHeader + " : ";
			}
			//  ������<<��(��һҳ)�͡�<��(ǰһҳ)
			if (current > 0) {
				pageNavigation += "<a href='" + url + pref
						+ "current=0'>[��ҳ]</a>\n" + "<a href='" + url + pref
						+ "current=" + (current - length) + "'>[<]</a>\n";
			}
			// ��������,��ͷ����һҳ��currentֵ
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
					// ��ǰҳ��,�Ӵ���ʾ
					pageNavigation += "<b>" + (i / length + 1) + "</b>\n";
				} else {
					
					pageNavigation += "<a href='" + url + pref + "current=" + i
							+ "'>" + (i / length + 1) + "</a>\n";
				}
			}
			//(��һҳ)�͡�>>��(���һҳ)
			if (current < size - length) {
				pageNavigation += "<a href='" + url + pref + "current="
						+ (current + length) + "'>[>]</a>\n" + "<a href='"
						+ url + pref + "current=" + lastPageOffset()
						+ "'>[βҳ]</a>\n";
			}
			
			return pageNavigation;
		}
		
		else {
			return "";
		}
	}

	/**
	 * ���ط�ҳ�����ҳ��
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
	 * �������һҳ����ʼ��¼λ��
	
	 */
	public int lastPageOffset() {
		return size - lastPageSize();
	}

	/**
	 * �������һҳ�ļ�¼��
	
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
