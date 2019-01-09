package com.kh.jinkuk.mypage.websoket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/broadcasting")
public class test {

	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());

	@OnMessage
	public void onMessage(String message, Session session) throws IOException {

		System.out.println("클라이언트로부터온 메세지 :" + message);
		synchronized (clients) {
			for (Session client : clients) {
				if (!client.equals(session)) {
					if (session.getQueryString().equals(client.getQueryString())) {
						System.out.println(session.getQueryString()+"공고로 매칭 성공!");
						client.getBasicRemote().sendText(message);
					}
				}else {
					client.getBasicRemote().sendText("상대방  x");
				}
			}
		}
	}

	@OnOpen
	public void onOpen(Session session) {
		System.out.println(session+"웹소켓 들어옴");
		String n = session.getQueryString();
		System.out.println(session+"이 보낸 쿼리스트링 :" + n);
		clients.add(session);
	}

	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		clients.remove(session);
	}
}