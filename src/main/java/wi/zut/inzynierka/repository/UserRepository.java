package wi.zut.inzynierka.repository;


import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import wi.zut.inzynierka.entity.User;


@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
	User findByUsername(String username);
	User findById(int theId);
	List<User> findAll();
	@Modifying
	@Query(value = "UPDATE users_roles r SET r.role_id = :roleId WHERE r.user_id = :theId", nativeQuery=true)
	void updateRoleUser(@Param("roleId") int roleNumber, @Param("theId") int theId);
}
