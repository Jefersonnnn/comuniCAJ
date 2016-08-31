<form>
  <fieldset>
     <legend id="aid"></legend>
     		<label>
    		   Descricao:</br>
     		     <textarea rows="3" cols="30" id="descricao" name="descricao"></textarea>
     		 </label>   
      	 <label><br>
    		    Data Inicio:</br>
  	         <input type="datetime-local" name="data_ini" id="data_ini" />
     		 </label>
     		 <label><br>
      	   	Data Fim:</br>
     		     <input type="datetime-local"  name="data_fim" id="data_fim"/>
     		 </label></br>
   			     <input type="button" onClick="atualizaBairro()" value="Atualizar" />   
             <input type="button" onClick="limpaBairro()" value="limpar"/> 

  </fieldset>       
</form> 