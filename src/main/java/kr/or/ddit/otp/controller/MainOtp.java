package kr.or.ddit.otp.controller;

import java.util.Scanner;

//public class Main {

//	 public static void main(String[] args) throws IOException, WriterException {
//	        String secretKey = "SSTHQIYOIB53IBZUFQOZHXJHOGSSPHKY";
//
//	        String lastCode = null;
//	        
//	        while (true) {
//	            String code = getTOTPCode(secretKey);
//	            if (!code.equals(lastCode)) {
////	                System.out.println(code);
//	            }
//	            lastCode = code;
//	            try {
//	                Thread.sleep(1000);
//	            } catch (InterruptedException e) {};
//	        }
//	        
//	    }
//}

public class MainOtp {

    public static void main(String[] args) {
        Totp totp = new Totp();
        Scanner sc = new Scanner(System.in);
        System.out.print("Input your email : ");
        String yourEmail = sc.nextLine();
        String secret = totp.generateSecret(yourEmail);
    
        System.out.println("your secret code : " + secret);
        System.out.println("your QR url : " + totp.getDataUrl());

        boolean res = false;
        while(!res) {
            System.out.print("Input Generated Code : ");
            String verifyCode = sc.nextLine();
            res = totp.verifyQR(verifyCode);
            System.out.println("result : " + res);
        }
    }
}
