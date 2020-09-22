package wi.zut.inzynierka.service;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import wi.zut.inzynierka.entity.User;
import wi.zut.inzynierka.user.CrmUser;

public interface UserService extends UserDetailsService {
	User findByUserName(String userName);

    void saveUser(CrmUser crmUser);
    List<User> findAll();
    User findById(int theId);
    void updateUser(int theId, int roleNumber);
}
