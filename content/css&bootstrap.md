* transition主要包含四个属性值：
	- 执行变换的属性：transition-property :

		none(没有属性改变)；all（所有属性改变）这个也是其默认值；indet（元素属性名）
	
	- 变换延续的时间：transition-duration:
		
		默认值为0
	
	- 在延续时间段，变换的速率变化transition-timing-function  
		
		ease：（逐渐变慢）默认值

		linear：（匀速）

		ease-in：(加速)

		ease-out：（减速）

		ease-in-out：（加速然后减速）

		cubic-bezier：（该值允许你去自定义一个时间曲线）， 特定的cubic-bezier曲线。 (x1, y1, x2, y2)四个值特定于曲线上点P1和点P2。所有值需在[0, 1]区域内，否则无效。

	- 变换延迟时间transition-delay
		
		ransition-delay是用来指定当改变元素属性值后多长时间开始执行transition效果

* cursor属性：规定要显示的光标的类型（形状）。
* ：hover 选择器：:用于选择鼠标指针浮动在上面的元素。
	
	提示：
	
	:link 选择器设置指向未被访问页面的链接的样式，
	
	:visited 选择器用于设置指向已被访问的页面的链接，
	
	:active 选择器用于活动链接。

	注释：在 CSS 定义中，:hover 必须位于 :link 和 :visited 之后（如果存在的话），这样样式才能生效。

* Transform（变形）：

	transform-origin(X,Y):用来设置元素的运动的基点（参照点）,
	
	值：X:left,center,right;Y:top,center,bottom。
	X和Y的值可以是百分值,em,px。
	
	旋转rotate(<angle>) 

	扭曲skew(<angle>):skew(x,y)/skewX(x)/skewX(x)

	缩放scale(<number>):scale(x,y)/scaleX(x)/scaleY(y)

	移动translate(<number>)：translate(x,y)/translateX/translateY

	矩阵变形matrix

* 伪元素：

	- :before 
	- :after 

*  border-collapse:collapse:表格设置合并边框模型.
*  border-spacing：设置相邻单元格的边框间的距离（仅用于“边框分离”模式）。

	table
  		{
  		border-collapse:separate;
  		border-spacing:10px 50px;
  		}

* HTML <td> 标签的 rowspan 属性:规定单元格可横跨的行数。

	rowspan="0" 指示浏览器横跨到表格部分的最后一行（thead、tbody 或者 tfoot）。

* HTML <td> 标签的 colspan 属性:规定单元格可横跨的列数。

	colspan="0" 指示浏览器横跨到列组的最后一列。