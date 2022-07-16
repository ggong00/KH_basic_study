package hello.core.order;

import hello.core.annotation.MainDiscountAnnotation;
import hello.core.discount.DiscountPolicy;
import hello.core.member.MemberRepository;
import org.springframework.stereotype.Component;


@Component
public class OrderServiceImpl implements OrderService {
    private final MemberRepository memberRepository;
    private final DiscountPolicy discountPolicy;

    public OrderServiceImpl(MemberRepository memberRepository, @MainDiscountAnnotation DiscountPolicy discountPolicy) {
        this.memberRepository = memberRepository;
        this.discountPolicy = discountPolicy;
    }

    @Override
    public Order createOrder(Long memberId, String itemName, int itemPrice) {
        int discount = discountPolicy.discount(memberRepository.findById(memberId),itemPrice);
        Order order = new Order(memberId,itemName,itemPrice,discount);
        return order;
    }

}
