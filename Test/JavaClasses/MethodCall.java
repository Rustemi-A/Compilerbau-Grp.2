
public class MethodCall {
	MethodIntZeroReturn o;
	
	int foo() {
		o = new MethodIntZeroReturn();
		return o.foo();
	}
}
