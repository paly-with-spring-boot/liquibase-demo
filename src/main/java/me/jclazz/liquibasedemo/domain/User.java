package me.jclazz.liquibasedemo.domain;

import lombok.Data;
import me.jclazz.liquibasedemo.enums.UserStatusEnums;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.util.CollectionUtils;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@Entity
@Table(name="t_user")
@DynamicInsert
@DynamicUpdate
public class User {
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid2")
    @Column(name = "f_id")
    private String id;

    @Column(name = "f_login_name",nullable = false,unique = true)
    private String loginName;

    @Column(name = "f_password",nullable = false)
    private String password;

    @Column(name = "f_display_name",nullable = false)
    private String displayName;

    @Column(name = "f_email")
    private String email;

    @Column(name = "f_cell_phone_number")
    private String cellPhoneNumber;

    @Enumerated(EnumType.STRING)
    @Column(name = "f_status",nullable = false)
    private UserStatusEnums status;

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<UserAuthority> authorities;

    @Version
    @Column(name = "f_version")
    private Long version;

    @Column(name = "f_created_time", updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdTime;

    @Column(name = "f_modified_time", updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date modifiedTime;

    public UserAuthority addUserAuthority(UserAuthority userAuthority) {
        if (CollectionUtils.isEmpty(authorities)) {
            authorities = new ArrayList<>();
        }
        authorities.add(userAuthority);
        userAuthority.setUser(this);

        return userAuthority;
    }

    public UserAuthority removeUserAuthority(UserAuthority userAuthority) {
        authorities.remove(userAuthority);
        userAuthority.setUser(null);

        return userAuthority;
    }
}
