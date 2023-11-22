package com.estore.project.utils;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

public class TokenUtils {

    private static final long EXPIRATION_TIME = 30 * 60 * 1000; // 30分钟
    private static final String SECRET = "123456"; // 密钥，请自行修改
    private static final String TOKEN_PREFIX = "Bearer";
    private static final String ADMIN_TOKEN_HEADER = "Admin-Token";
    private static final String APP_TOKEN_HEADER = "token";

    public static void main(String[] args) {
        System.out.println(generateAppToken("obPN26z7mwYwr_BBPQiIA29DMtiU"));
    }


    /**
     * 不过期
     * @param
     * @return
     */
    public static String generateAppToken(String userId) {
        return Jwts.builder()
                .setSubject(userId)
//                .claim("role", "app")
//                .setExpiration(new Date(System.currentTimeMillis() + EXPIRATION_TIME))
                .signWith(SignatureAlgorithm.HS512, SECRET)
                .compact();
    }

    public static Claims parseToken(String token) {
        return Jwts.parser()
                .setSigningKey(SECRET)
                .parseClaimsJws(token)
                .getBody();
    }


    public static String getAppTokenHeader() {
        return APP_TOKEN_HEADER;
    }
}
