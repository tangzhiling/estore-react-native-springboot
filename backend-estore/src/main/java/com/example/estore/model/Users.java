package com.example.estore.model;


import jakarta.persistence.*;
import org.apache.ibatis.annotations.One;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "Users")
public class Users {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @OneToMany(mappedBy = "users", cascade = CascadeType.REMOVE, orphanRemoval = true)
    private List<Address> addresses = new ArrayList<>();

    public Long getId() { return id;}
    public void setId() {this.id = id;}


    @Column(name = "username", nullable = false, unique = true)
    private String username;

    public String getUsername() { return username;}
    public void setUsername() {this.username = username;}


    @Column(name = "email", nullable = false, unique = true, length = 320)
    private String email;

    public String getEmail() { return email;}
    public void setEmail() {this.email = email;}


    @Column(name = "password", nullable = false, length = 1000)
    private String password;

    public String getPassword() {return password;}
    public void setPassword() {this.password = password;}


    @Column(name = "first_name", nullable = false)
    private String firstName;

    public String getFirstName() {return firstName;}
    public void setFirstName() {this.password = firstName;}


    @Column(name = "last_name", nullable = false)
    private String lastName;

    public List<Address> getAddresses() {
        return addresses;
    }

    public void setAddresses(List<Address> addresses) {
        this.addresses = addresses;
    }

    public String getLastName() {return lastName;}
    public void setLastName() {this.lastName = lastName;}




}
