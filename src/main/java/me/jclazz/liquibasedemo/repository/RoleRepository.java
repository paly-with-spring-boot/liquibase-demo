package me.jclazz.liquibasedemo.repository;


import me.jclazz.liquibasedemo.domain.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository extends JpaRepository<Role,String> {
    Role findRoleByName(String name);
}
