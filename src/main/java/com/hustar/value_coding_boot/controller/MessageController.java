package com.hustar.value_coding_boot.controller;

import java.io.IOException;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;

@Controller
@ServerEndpoint("/websocket")
public class MessageController extends Socket {
    private static final List<Session> session = new ArrayList<Session>();
	
    @OnOpen
    public void open(Session newUser) {
        session.add(newUser);
    }
    
    @OnMessage
    public void getMsg(Session recieveSession, String msg) {
       
        for (int i = 0; i < session.size(); i++) {
            try {
                session.get(i).getBasicRemote().sendText(msg);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}