package User.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import User.model.service.UserService;

import User.model.vo.User;

/**
 * Servlet implementation class PwdFindEmail
 */
@WebServlet("/pwdFindEmail.me")
public class PwdFindEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PwdFindEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String email = request.getParameter("email");
		
		User m = new UserService().userIdsearch(userId);
		if(m==null || !m.getEmail().equals(email))
        {
            request.setAttribute("msg", "아이디나 이메일 정보가 맞지 않습니다");
            request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
            return;
        }
		
		String host = "smtp.naver.com";
        String user = "omiljomil123@naver.com"; //자신의 네이버 계정
        String password = "omiljomil321!@";//자신의 네이버 패스워드
		
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", 465);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        
      //인증 번호 생성기
        StringBuffer temp =new StringBuffer();
        Random rnd = new Random();
        for(int i=0;i<10;i++)
        {
            int rIndex = rnd.nextInt(3);
            switch (rIndex) {
            case 0:
                // a-z
                temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                break;
            case 1:
                // A-Z
                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                break;
            case 2:
                // 0-9
                temp.append((rnd.nextInt(10)));
                break;
            }
        }
        String AuthenticationKey = temp.toString();
        System.out.println(AuthenticationKey);
        
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user,password);
            }
        });
        try {
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(user, "오밀조밀"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            
            //메일 제목
            msg.setSubject("안녕하세요 오밀조밀 인증 메일입니다.");
            //메일 내용
            msg.setText("인증 번호는 :"+temp);
            
            Transport.send(msg);
            System.out.println("이메일 전송");
            
        }catch (Exception e) {
            e.printStackTrace();
        }
        HttpSession saveKey = request.getSession();
        saveKey.setAttribute("Key", AuthenticationKey);
        request.setAttribute("id", userId);
        request.getRequestDispatcher("WEB-INF/views/User/pwdFindCeNumForm.jsp").forward(request, response);
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
