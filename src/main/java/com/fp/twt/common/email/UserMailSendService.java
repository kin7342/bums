package com.fp.twt.common.email;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import com.fp.twt.biz.MypageBiz;
import com.fp.twt.vo.MemberVo;

@Repository
public class UserMailSendService {
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private MypageBiz biz;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	// 이메일 난수 만드는 메서드
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}

	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}

	// 회원가입 발송 이메일(인증키 발송)
	public void mailSendWithUserKey(String m_Email, String m_Id, HttpServletRequest request) {
		String key = getKey(false, 20);
		biz.GetKey(m_Id, key);
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 !</h2><br><br>" + "<h3>" + m_Id + "님</h3>"
				+ "<p>인증하기 버튼을 누르시면 TWT 사이트에 로그인을 하실 수 있습니다 : " + "<a href='http://localhost:8787"
				+ request.getContextPath() + "/keyAlter.do?m_Id=" + m_Id + "&m_Mailcheck=" + key + "'>인증하기</a></p>";
		try {
			mail.setSubject("[본인인증] TWT - Travle With Together 인증 메일입니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(m_Email));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	public int alterUserkey(String m_Id, String key) {

		int resultCnt = 0;

		resultCnt = biz.alterUserkey(m_Id, key);

		return resultCnt;
	}

	// 비밀번호 찾기 이메일 발송
	public void mailSendWithPassword(String m_Id, String m_Email, HttpServletRequest request) {
		MemberVo vo = new MemberVo();
		String key = getKey(false, 6);

		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 '" + m_Id + "' 님</h2><br><br>" + "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>"
				+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + key
				+ "'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
				+ "<h3><a href='http://localhost:8787/twt/'>TWT 홈페이지 접속 ^0^</a></h3><br><br>";
		try {
			mail.setSubject("[임시 비밀번호 발급] TWT - Travle With Together 임시비밀번호 발급 안내입니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(m_Email));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		// 비밀번호 암호화해주는 메서드
		key = passwordEncoder.encode(key);
		
		vo.setm_Pass(key);
		
		vo.setm_Id(m_Id);
		
		vo.setm_Email(m_Email);
		
		// 데이터 베이스 값은 암호한 값으로 저장시킨다.
		biz.searchPassword(vo);
	}
}
