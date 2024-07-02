package Login;

import java.sql.Date;

public class LoginDTO {
		private int idx;
		private String id;
		private String pass;
		private String name;
		private String email;
		private String phone;
		private String address;
		private String address_sub;
		private String gender;
		private String birthdate;
		private int auth_type;
		
		
		public int getIdx() {
			return idx;
		}
		public void setIdx(int idx) {
			this.idx = idx;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getPass() {
			return pass;
		}
		public void setPass(String pass) {
			this.pass = pass;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getAddress_sub() {
			return address_sub;
		}
		public void setAddress_sub(String address_sub) {
			this.address_sub = address_sub;
		}
		public String getGender() {
			return gender;
		}
		public void setGender(String gender) {
			this.gender = gender;
		}
		public String getBirthdate() {
			return birthdate;
		}
		public void setBirthdate(String birthdate) {
			this.birthdate = birthdate;
		}
		public int getAuth_type() {
			return auth_type;
		}
		public void setAuth_type(int auth_type) {
			this.auth_type = auth_type;
		}
		
		
}
