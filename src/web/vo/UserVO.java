package web.vo;

public class UserVO {
	private String id,pw,name,email, prefer;
	private int age;
	
	public UserVO() {
		super();
	}
	
	public UserVO(String id, String pw, String name, String email, int age) {
		setId(id);
		setPw(pw);
		setName(name);
		setEmail(email);
		setAge(age);
	}
	
	public UserVO(String id, String pwd) {
		setId(id);
		setPw(pwd);
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		if(id!=null&&!id.equals("")) this.id = id;
		else System.out.println("아이디를 입력해주세요.");
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		if(pw!=null&&!pw.equals("")) this.pw = pw;
		else System.out.println("아이디를 입력해주세요.");
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		if(name!=null&&!name.equals("")) this.name = name;
		else System.out.println("이름을 입력해주세요.");
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		if(email!=null&&!email.equals("")) this.email = email;
		else System.out.println("이메일을 입력해주세요.");
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		if(age>0) this.age = age;
		else System.out.println("나이를 다시 입력해주세요.");
	}
	public String getPrefer() {
		return prefer;
	}
	public void setPrefer(String prefer) {
		if(prefer!=null&&!prefer.equals("")) this.prefer = prefer;
		else System.out.println("선호동네를 입력해주세요.");
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pw=" + pw + ", name=" + name + ", email=" + email + ", prefer=" + prefer
				+ ", age=" + age + "]";
	}
}