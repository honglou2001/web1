package domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

public class AuthorityResVal extends BaseEntity {

	private String fid;
	private Integer fsysid;
	private Long id;
	private String text;
	private Collection<AuthorityResVal> children = new ArrayList<AuthorityResVal>();
	private Boolean checked = false;
	private String fmenuid;
	private Map<String, String> attributes=null; 
	

	public Boolean getChecked() {
		return checked;
	}
	public void setChecked(Boolean checked) {
		this.checked = checked;
	}
	public String getFid() {
		return fid;		
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	
	public Integer getFsysid() {
		return fsysid;
	}
	public void setFsysid(Integer fsysid) {
		this.fsysid = fsysid;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	public Collection<AuthorityResVal> getChildren() {
		return children;
	}
	public void setChildren(Collection<AuthorityResVal> children) {
		this.children = children;
	}
	public String getFmenuid() {
		return fmenuid;
	}
	public void setFmenuid(String fmenuid) {
		this.fmenuid = fmenuid;
	}
	public Map<String, String> getAttributes() {
		return attributes;
	}
	public void setAttributes(Map<String, String> attributes) {
		this.attributes = attributes;
	}
}