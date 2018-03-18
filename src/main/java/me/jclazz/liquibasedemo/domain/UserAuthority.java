package me.jclazz.liquibasedemo.domain;

import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Data
@Entity
@Table(name = "t_user_authority")
public class UserAuthority {
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid2")
    @Column(name = "f_id")
    private String id;

    @ManyToOne
    @JoinColumn(name = "f_role_id", referencedColumnName = "f_id")
    private Role role;

    @ManyToOne
    @JoinColumn(name = "f_user_id", referencedColumnName = "f_id")
    private User user;
}
