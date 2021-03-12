package org.sb.manage.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class PageDTO {

   private int startPage;
   private int endPage;
   private boolean prev, next;
   
   private int total;
   private Page page;
   
   public PageDTO(Page page, int total) {
      this.page = page;
      this.total = total; //30
      
      this.endPage = (int)(Math.ceil(page.getPageNum() / 10.0 )) * 10;//1
      this.startPage = this.endPage - 9;//-8
      int realEnd = (int)( Math.ceil((total * 1.0) / page.getAmount()) );
      //
      if(realEnd < this.endPage) {
         this.endPage = realEnd;
      }
      this.prev = this.startPage > 1;
      this.next = realEnd > this.endPage;
   }
   
   
}