x* transition主要包含四个属性值：
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

* :nth-child(__n__) 选择器 : 匹配属于其父元素的第 N 个子元素，_不论元素的类型_。n 可以是数字、关键词或公式。
		
	规定属于其父元素的第二个子元素的每个 p 的背景色：
	<!--python--> 
		p:nth-child(2)
		{
			background:#ff0000;
		}

* :nth-of-type(__n__) 选择器匹配属于父元素的_特定类型_的第 N 个子元素的每个元素。n 可以是数字、关键词或公式。

	规定属于其父元素的第二个 p 元素的每个 p：
	<!--python--> 
		p:nth-of-type(2)
		{
			background:#ff0000;
		}

* :first-child 选择器用于选取属于其父元素的首个子元素的指定选择器。

	选择列表中的第一个 <li> 元素并设置其样式：
	<!--python-->	
		li:first-child
		{

			background:yellow;
		}

* HTML < td > 标签的 scope 属性:

	+ 值有：col, row, colgroup, rowgroup

	+ 定义将表头单元与数据单元相关联的方法。

	+ 标识某个单元是否是列、行、列组或行组的表头。

	+ 不会在普通浏览器中产生任何视觉变化。

	+ 屏幕阅读器可以利用该属性。
	
* <span> 标签被用来组合文档中的行内元素。
	
	span 没有固定的格式表现。当对它应用样式时，它才会产生视觉上的

	变化。
	
	可以为 span 应用 id 或 class 属性，这样既可以增加适当的语义，又便于
	
	对 span 应用样式。

* 相邻兄弟选择器（Adjacent sibling selector）可选择紧接在另一元素后的元素，且二者有相同父元素。

	- 相邻兄弟选择器使用了加号（+），即相邻兄弟结合符（Adjacent sibling combinator）。

	- 例如，如果要增加紧接在 h1 元素后出现的段落的上边距，可以这样写：

		<!--python-->	
		
			h1 + p {
				margin-top:50px;
			}

	这个选择器读作：“选择紧接在 h1 元素后出现的段落，h1 和 p 元素拥有共同的父元素”。

* able-layout 属性: 用来显示表格单元格、行、列的算法规则。

	- 值：
		
	 + automatic	默认。列宽度由单元格内容设定。	 
	 + fixed	列宽由表格宽度和列宽度设定。
	 + inherit	规定应该从父元素继承 table-layout 属性的值。__任何的版本的 Internet Explorer （包括 IE8）都不支持属性值 "inherit"__
	 

* !important 语法:覆盖原本的权重。

* 所有的 inline 元素都没有 width 和 height。
  
  	可以设置 display: block; 把 inline 元素当作 block 元素来处理，再设置 width 和 height。

