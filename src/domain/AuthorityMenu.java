package domain;
//default package

import java.sql.Time;


/**
* AuthorityMenu entity. @author MyEclipse Persistence Tools
*/

public class AuthorityMenu {


	 // Fields    
	  private String fid;
	  private String fparentId;
	  private Integer fincreaseId;
	  private String fmenuName;
	  private String furl;
	  private String ficon;
	  private Long fauthorityVal;
	  private Integer fsysId;
	  private String fcreateUser;
	  private Time fcreateTime;
	  private String fmodifyUser;
	  private String fmodifyTime;
	  private Integer flevel;
	  private Integer ftype;
	  private Integer fstate;
	  private Boolean fisDeleted;
	  private Boolean fisFixed;
	  private String fdescription;
	
	 // Property accessors
	
	 public String getFid() {
	     return this.fid;
	 }
	 
	 public void setFid(String fid) {
	     this.fid = fid;
	 }
	
	 public String getFparentId() {
	     return this.fparentId;
	 }
	 
	 public void setFparentId(String fparentId) {
	     this.fparentId = fparentId;
	 }
	
	 public Integer getFincreaseId() {
	     return this.fincreaseId;
	 }
	 
	 public void setFincreaseId(Integer fincreaseId) {
	     this.fincreaseId = fincreaseId;
	 }
	
	 public String getFmenuName() {
	     return this.fmenuName;
	 }
	 
	 public void setFmenuName(String fmenuName) {
	     this.fmenuName = fmenuName;
	 }
	
	 public String getFurl() {
	     return this.furl;
	 }
	 
	 public void setFurl(String furl) {
	     this.furl = furl;
	 }
	
	 public String getFicon() {
	     return this.ficon;
	 }
	 
	 public void setFicon(String ficon) {
	     this.ficon = ficon;
	 }
	
	 public Long getFauthorityVal() {
	     return this.fauthorityVal;
	 }
	 
	 public void setFauthorityVal(Long fauthorityVal) {
	     this.fauthorityVal = fauthorityVal;
	 }
	
	 public Integer getFsysId() {
	     return this.fsysId;
	 }
	 
	 public void setFsysId(Integer fsysId) {
	     this.fsysId = fsysId;
	 }
	
	 public String getFcreateUser() {
	     return this.fcreateUser;
	 }
	 
	 public void setFcreateUser(String fcreateUser) {
	     this.fcreateUser = fcreateUser;
	 }
	
	 public Time getFcreateTime() {
	     return this.fcreateTime;
	 }
	 
	 public void setFcreateTime(Time fcreateTime) {
	     this.fcreateTime = fcreateTime;
	 }
	
	 public String getFmodifyUser() {
	     return this.fmodifyUser;
	 }
	 
	 public void setFmodifyUser(String fmodifyUser) {
	     this.fmodifyUser = fmodifyUser;
	 }
	
	 public String getFmodifyTime() {
	     return this.fmodifyTime;
	 }
	 
	 public void setFmodifyTime(String fmodifyTime) {
	     this.fmodifyTime = fmodifyTime;
	 }
	
	 public Integer getFlevel() {
	     return this.flevel;
	 }
	 
	 public void setFlevel(Integer flevel) {
	     this.flevel = flevel;
	 }
	
	 public Integer getFtype() {
	     return this.ftype;
	 }
	 
	 public void setFtype(Integer ftype) {
	     this.ftype = ftype;
	 }
	
	 public Integer getFstate() {
	     return this.fstate;
	 }
	 
	 public void setFstate(Integer fstate) {
	     this.fstate = fstate;
	 }
	
	 public Boolean getFisDeleted() {
	     return this.fisDeleted;
	 }
	 
	 public void setFisDeleted(Boolean fisDeleted) {
	     this.fisDeleted = fisDeleted;
	 }
	
	 public Boolean getFisFixed() {
	     return this.fisFixed;
	 }
	 
	 public void setFisFixed(Boolean fisFixed) {
	     this.fisFixed = fisFixed;
	 }
	
	 public String getFdescription() {
	     return this.fdescription;
	 }
	 
	 public void setFdescription(String fdescription) {
	     this.fdescription = fdescription;
	 }

}