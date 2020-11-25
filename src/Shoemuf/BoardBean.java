package Shoemuf;

public class BoardBean {
	
	private String id;
	private String title;
	private String content;
	private String writeDate;
	
	public BoardBean() {}
	
	public BoardBean(String title, String content) {
		this.title = title;
		this.content = content;
	}
	
	public BoardBean(String id, String title, String content, String writeDate) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
	}	

	public String getId() {		return id;	}
	public void setId(String id) {		this.id = id;	}
	public String getTitle() {		return title;	}
	public void setTitle(String title) {		this.title = title;	}
	public String getContent() {		return content;	}
	public void setContent(String content) {		this.content = content;	}
	public String getWriteDate() {		return writeDate;	}
	public void setWriteDate(String writeDate) {		this.writeDate = writeDate;	}

	
}
