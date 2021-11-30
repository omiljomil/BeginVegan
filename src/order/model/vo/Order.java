package order.model.vo;

public class Order {
   
   private int orderNo;
   private String userId;
   private int prodNo;
   private String prodName;
   private int amount;
   private int price;
   private String optionName;
   private String optionCount;   
   private int total;
   
   public Order() {}

   public Order(int orderNo, String userId, int prodNo, String prodName, int amount, int price, String optionName,
         String optionCount, int total) {
      super();
      this.orderNo = orderNo;
      this.userId = userId;
      this.prodNo = prodNo;
      this.prodName = prodName;
      this.amount = amount;
      this.price = price;
      this.optionName = optionName;
      this.optionCount = optionCount;
      this.total = total;
   }
   
   

   public int getOrderNo() {
      return orderNo;
   }

   public void setOrderNo(int orderNo) {
      this.orderNo = orderNo;
   }

   public String getUserId() {
      return userId;
   }

   public void setUserId(String userId) {
      this.userId = userId;
   }

   public int getProdNo() {
      return prodNo;
   }

   public void setProdNo(int prodNo) {
      this.prodNo = prodNo;
   }

   public String getProdName() {
      return prodName;
   }

   public void setProdName(String prodName) {
      this.prodName = prodName;
   }

   public int getAmount() {
      return amount;
   }

   public void setAmount(int amount) {
      this.amount = amount;
   }

   public int getPrice() {
      return price;
   }

   public void setPrice(int price) {
      this.price = price;
   }

   public String getOptionName() {
      return optionName;
   }

   public void setOptionName(String optionName) {
      this.optionName = optionName;
   }

   public String getOptionCount() {
      return optionCount;
   }

   public void setOptionCount(String optionCount) {
      this.optionCount = optionCount;
   }

   public int getTotal() {
      return total;
   }

   public void setTotal(int total) {
      this.total = total;
   }

   @Override
   public String toString() {
      return "Order [orderNo=" + orderNo + ", userId=" + userId + ", prodNo=" + prodNo + ", prodName=" + prodName
            + ", amount=" + amount + ", price=" + price + ", optionName=" + optionName + ", optionCount="
            + optionCount + ", total=" + total + "]";
   }
   
   

   
}