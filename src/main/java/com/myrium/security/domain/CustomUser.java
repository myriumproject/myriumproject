package com.myrium.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.myrium.domain.MemberVO;

public class CustomUser extends User {

    private static final long serialVersionUID = 1L;
    private MemberVO member;

    public CustomUser(String username, String password, 
                      Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
    }

    public CustomUser(MemberVO vo) {
        super(vo.getCustomerId(), vo.getPassword(),
              vo.getAuthList().stream()
                .map(auth -> new SimpleGrantedAuthority("ROLE_" + auth.getRole()))
                .collect(Collectors.toList()));
        this.member = vo;
    }

    public MemberVO getMember() {
        return member;
    }
}
