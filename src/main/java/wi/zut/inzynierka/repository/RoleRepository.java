package wi.zut.inzynierka.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import wi.zut.inzynierka.entity.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Integer> {
	public Role findRoleByName(String theRoleName);
}
