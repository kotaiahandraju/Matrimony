<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css"/>
<style>
blockquote
{background:#f7f7f7;padding:15px;border:1px solid #eee;text-align:justify;position:relative;
font-weight:500;clear:both;}
blockquote {
    background: #f9f9f9;
    border-left: 1px solid #ccc;
    margin: 1.5em 10px;
    padding: 0.9em 17px;
    quotes: "\201C""\201D""\2018""\2019";
}
blockquote:before{color:#319604;position:absolute;line-height:1;font-size:10px;z-index:0;
transition:.2s ease-in;font-family:FontAwesome;left: -3px;
    top: -2px;font-style:normal;padding:5px;content:"\f10d";}
blockquote:after{content:"\f10e";position:absolute;font-size:10px;color:#319604;z-index:0;
font-family:FontAwesome;line-height:1;bottom:-4px;right:-3px;font-style:normal;transition:.2s ease-in;padding:7px;}
blockquote p {
  display: inline;
}
.col-md-5 {
padding-left:0px;
padding-right:0px;
}
p {
font-size:13px;
}
.matches1 {
border: 1px solid #d6d6d6;
 background: #fff; 

}
 .matches1 h4 {
/* background: #f1f1f1; */
margin-left:15px;
font: bold 15px arial;
}
.Subl {
background-color: #FFF;
padding: 1px;
}
.on {
/* background-color: #F1F1F1; */
margin: 3px;
padding: 6px 4px;
font-weight: bold;


}
.picstyle {
/* height:220px !important; */
overflow:hidden !important;
margin-bottom:5px;
}
.controls {
  margin-bottom: 10px;
}
.panel-title {
text-align:left;
}
.collapse-group {
  
  border: 1px solid #d6d6d6;
  margin-bottom: 10px;
}

.panel-title .trigger:before {
  content: '\e082';
  font-family: 'Glyphicons Halflings';
  vertical-align: text-bottom;
  margin-left:2px;
  float:right;
}

.panel-title .trigger.collapsed:before {
  content: '\e081';
}

.new {
margin-left:10px;
}</style>

<div class="col-md-3 products-grid-right">
			<div class="matches1"><h4>Matches</h4><div class="Subl">
<!-- 			<p class="on"></p> -->
			<p class="new"><a href="yetToBeViewed" >Profiles yet to be viewed (${cacheGuest.yetToBeViewedCount})</a></br>

<!-- <a href="">Extended Matches</a><br> -->

<a href="viewedNotContacted">Profiles viewed & not contacted (${cacheGuest.viewedNotContactedCount})</a><br>

<!-- <a href="">Members looking for me</a><br> -->

<!-- <a href="">Mutual Matches</a><br> -->

<a href="premiumMembers">Premium Members</a></p><br>
			</div></div>
		<br>
				
				
				
<div class="collapse-group">
  

  <div class="panel ">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="trigger collapsed">
       <b> Show Profiles Created</b> </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
         <p> <a href="#" onclick="submitMore('day')"> Within a day </a><br>
    <a href="#" onclick="submitMore('week')"> Within a week </a><br>
    <a href="#" onclick="submitMore('month')"> Within a month </a><br>
    <a href="#" onclick="submitMore('all')"> All </a><br>
    </p>   </div>
    </div>
  </div>

  <!-- <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo" class="trigger">
          Active
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
        Active Tab
      </div>
    </div>
  </div> -->
</div>

<div class="collapse-group">
  

  <div class="panel ">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" href="#collapseThree" aria-expanded="true" aria-controls="collapseThree" class="trigger">
         <b> Profile Type</b>
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
        <p> <a href="#" onclick="submitMore('photo')">  With Photo 
    </a><br>
    </p> 
      </div>
    </div>
  </div>

  <div class="panel" style="padding:10px 0px;">
    <div class="panel-heading" role="tab" id="headingFour">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" href="#collapseFour" aria-expanded="true" aria-controls="collapseFour" class="trigger">
         <b> Age</b> 
        </a>
      </h4>
    </div>
    <div id="collapseFour" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingFour">
      <div class="panel-body">
      <div class="">
      <select name="age_from" id="age_from" style="width:;height:30px;" class="optiondiv" size="1">
      <option value="">-From-</option>
      <option value="18">18</option><option value="19">19</option><option value="20">20</option>
      <option value="21">21</option><option value="22">22</option><option value="23">23</option>
      <option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option>
      <option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option>
      <option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option>
      <option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option>
      <option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option>
      <option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option>
      <option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option>
      <option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option>
      <option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option>
      <option value="60">60</option><option value="61">61</option><option value="62">62</option><option value="63">63</option>
      <option value="64">64</option><option value="65">65</option><option value="66">66</option><option value="67">67</option>
      <option value="68">68</option><option value="69">69</option><option value="70">70</option></select>&nbsp;&nbsp;to&nbsp;&nbsp;
      <select name="age_to" id="age_to" style="width:;height:30px;" class="optiondiv" size="1">
      <option value="">-To-</option>
      <option value="18">18</option><option value="19">19</option>
      <option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option>
      <option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option>
      <option value="28">28</option><option value="29">29</option><option value="30" >30</option>
      <option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option>
      <option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option>
      <option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option>
      <option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option>
      <option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option>
      <option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option>
      <option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option>
      <option value="59">59</option><option value="60">60</option><option value="61">61</option><option value="62">62</option>
      <option value="63">63</option><option value="64">64</option><option value="65">65</option><option value="66">66</option>
      <option value="67">67</option><option value="68">68</option><option value="69">69</option><option value="70">70</option>
      </select>&nbsp;&nbsp;Yrs<span class="errortext" id="ageerr"></span>&nbsp;&nbsp;<input class="" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%; border-radius: 3px; color: rgb(2, 116, 203); font-weight: normal; font-size: 12px; margin-left: 0px; padding: 5px; margin-top: -2px; border: 1px solid rgb(214, 214, 214); line-height: 16px;cursor:pointer !important;float:right; margin:5px 50px;" value="Submit" onclick="submitMore('');" type="button"></div>
        </div>
    </div>
  </div>
  <div class="panel ">
    <div class="panel-heading" role="tab" id="headingFive">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" href="#collapseFive" aria-expanded="true" aria-controls="collapseFive" class="trigger">
         <b> City</b> 
        </a>
      </h4>
    </div>
    <div id="collapseFive" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingFive">
      <div class="panel-body">
      <div class="" style="padding:5px;">
      <select name="city" id="city" style="padding:5px;width: 196px;height:32px;" class="optiondiv multiselect"   multiple="multiple">
      	<option value="all" >--Select City--</option>
      
      </select>&nbsp;&nbsp;<span class="errortext" id="cityerr"></span>&nbsp;&nbsp;<input class="" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%; border-radius: 3px; color: rgb(2, 116, 203); font-weight: normal; font-size: 12px; margin:0 50px; margin-left: 0px; float:right; padding: 5px; margin-top: -2px; border: 1px solid rgb(214, 214, 214); line-height: 16px;cursor:pointer !important;" value="Submit" onclick="submitMore('')" type="button"></div>
        </div>
    </div>
  </div>
  <div class="panel " style="margin-bottom:0px;">
    <div class="panel-heading" role="tab" id="headingSix">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" href="#collapseSix" aria-expanded="true" aria-controls="collapseSix" class="trigger">
         <b> Caste</b> 
        </a>
      </h4>
    </div>
    <div id="collapseSix" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingSix">
      <div class="panel-body">
      <div class="" style="padding:5px;">
      <select name="caste" id="caste" style="padding:5px;width: 196px;height:32px;" class="optiondiv multiselect"   multiple="multiple">
      	<option value="all" >--Select Caste--</option>
      
      </select>&nbsp;&nbsp;<span class="errortext" id="cityerr"></span>&nbsp;&nbsp;<input class="" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%; border-radius: 3px; color: rgb(2, 116, 203); font-weight: normal; font-size: 12px; margin:0 50px; margin-left: 0px; float:right; padding: 5px; margin-top: -2px; border: 1px solid rgb(214, 214, 214); line-height: 16px;cursor:pointer !important;" value="Submit" onclick="submitMore('')" type="button"></div>
        </div>
    </div>
  </div>
</div>
<c:if test="${cacheGuest.roleId == '4' || cacheGuest.membership_status == '0'}">
<a href="memberShipPage"><img  style="border-radius:10px;" src="${baseurl}/images/upgra.jpg" class="img-responsive"/></a>
</c:if>
			</div>
			<script>
			
			
			</script>