package com.hustar.value_coding_boot.controller;

import java.io.IOException;
import java.net.Socket;

import javax.websocket.OnMessage;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;

@Controller
@ServerEndpoint("/websocket")
public class MessageController extends Socket {
	
    @OnMessage
    public void getMsg(Session session, String msg) {
        try {
            session.getBasicRemote().sendText(msg);
        } catch (IOException e) {

            System.out.println("hey");
            e.printStackTrace();
        }
    }
}