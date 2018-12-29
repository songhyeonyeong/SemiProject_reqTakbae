package com.kh.jinkuk.member.controller;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;


public class SMTPAuthenticator extends Authenticator{
	PasswordAuthentication pa;

    public SMTPAuthenticator() {

        String id="takbububu@gmail.com";
        String pw = "qwer1234*";
        
        pa = new PasswordAuthentication(id, pw);
    }

	

    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
	
}