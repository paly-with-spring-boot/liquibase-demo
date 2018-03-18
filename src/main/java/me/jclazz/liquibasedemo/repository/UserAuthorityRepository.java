package me.jclazz.liquibasedemo.repository;


import me.jclazz.liquibasedemo.domain.UserAuthority;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserAuthorityRepository extends JpaRepository<UserAuthority,String> {
}
