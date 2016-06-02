public class Box<E> {
	E e;
	
	public Box(E e){
		this.e = e;
	}
	
	public void setValue(E e){
		this.e = e;
	}
	
	public E getValue(){
		return e;
	}
}