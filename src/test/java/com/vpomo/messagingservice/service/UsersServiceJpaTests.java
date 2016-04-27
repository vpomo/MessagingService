
package com.vpomo.messagingservice.service;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * <p> Integration test using the jpa profile.
 *
 * @see AbstractUsersServiceTests for more details. </p>
 */

@ContextConfiguration(locations = {"classpath:spring/business-config.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class UsersServiceJpaTests extends AbstractUsersServiceTests {

}