package com.studia;

import javax.xml.crypto.Data;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.MulticastSocket;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) throws IOException {

        DatagramSocket multicastSocket;
        int bufferSize;
        int port;
        String fineMessage = null;
        String addressIp = null;
        Scanner scanner = new Scanner(System.in);
        boolean isIPValid;
        do {
            System.out.println("Podaj port komunikacji");
            port = scanner.nextInt();
            System.out.println("podaj wielkość buffora");
            bufferSize = scanner.nextInt();
            System.out.println("Podaj address ip");
            if (scanner.hasNext()) {
                addressIp = scanner.next();
            }
            isIPValid = addressIp.matches("^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$");
        } while (!((port>1000 && port < 10000) && (bufferSize > 0 && bufferSize < 60000) && (isIPValid || addressIp.equals("localhost"))));


        TCP localhost = new TCP(addressIp, port, bufferSize, true);
        localhost.start();
        UDP udp = new UDP(port, addressIp, bufferSize);
        udp.start();
        System.out.println("write stop to STOP sending UDP data");
        do {
            if (scanner.hasNext()) {
                fineMessage = scanner.next();
            }
        } while (!fineMessage.equals("STOP"));

        System.out.println(fineMessage);
        localhost.stop();
        udp.stop();
        multicastSocket = new MulticastSocket();
        InetAddress inetAddress = InetAddress.getByName(addressIp);
        byte[] firstMessage = "FINE".getBytes();
        DatagramPacket datagramPacket = new DatagramPacket(firstMessage, firstMessage.length, inetAddress, port);
        multicastSocket.send(datagramPacket);
    }
}
