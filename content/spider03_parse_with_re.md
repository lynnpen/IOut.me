 # 代码日常积累

* 打开点号匹配换行符（re.DOTALL）
* 代码中不要出现中文。
* 若出现以下类似情况，


	- 喜欢的菜： 金枪鱼
	- 喜欢的菜： 意大利经典
  
 	 不想出现“：”。

  	可以限制 print 的范围，用 [:-1] 来限制，" [ ] " 里 " : " 是指从开始到。。。" -1 "是右数倒数第一个之前。


* 缩小获取匹配范围可以用 " ^ " 非。。。 比如：[ ^ >],指在所有符合匹配的文本中，不要中间出现" > "的匹配。
* 缩小范围也可以在匹配中获取匹配。 


* python读取文件一般要用os包。
	
	import os


* 获取指定目录下所有文件和目录名。		

	os.listdir(path)

* 逐行读取文件内容
	
	. readline()

* 文件路径：绝对路径+相对路径（通过+来使路径组合起来）

	绝对路径： \_\_file\_\_当前目录
	
	用法：BASE_DIR =\_\_file\_\_[:-*] 

		（*）为数字，使当前目录中最后一部分不参与
		

* list，[ ] ，有顺序，可改。  后加.append在最后一个元素最后再加一个元素。  .sort 按照第一个字母顺序排列。

* tuple，( )，不可变。tuple[ ]，[ ]中填放数字，表示第*个item。
   
    一般用于输出，如：
   print '%s is %d years old' % (name，age)

* dictionary,｛key1 : value1，key2 : value2｝,无序，key唯一，不可变量；value不唯一，不可变/可变量。 

	  使用:
		
		
		ab = ｛key1 : value1，key2 : value2｝
        
		ab[key1] = value1
	 
		
	 循环：
		
	- for k,v in ab.items():
	- for k in ab.keys():
	- for v in ab.values():
	- for m in ab:默认为key.
	 
* Control Flow:		if
	
	条件选择式执行，基本结构：if-elif-else ( elif,else 可选 )

* Control Flow:     while
	
	是一个looping (循环结构)，基本结构：while-else (else 可选)
 	
	while __true__: (ture代表真，可被看作1，但任意非0数字都作为true)

	while __false__: (false代表假，可用0替代)
	
	当while后面为 true 的时候，循环一直继续直到while后面跟 false, 循环才结束。

* Control Flow:		for
	
	顺序的遍历每个item，基本结构：for...in
	循环中不能打开或者读写文件（速度慢）

* Control Flow:		break
	
	跳出，while或者for的loop,也不执行相对应的 else 循环。

* JSON：	数据交换格式

	结构：
	- dic/map
	- 有序列表（list）
	- ！！ json 没有set(集合)

	load ： 读文件	

	loads : 读字符串（其中 s 代表 string）


	__幂等：程序的结果执行结果是一致的。__
	
	__dump__:

		w : 每次先清空再写入。
		a : 追加。每次重复写入。（最好别用）

	
	- 更新 json 时，先将 json 中的 data, load 出来放在一个变量中；
	- 将新的 data 追加在变量中；
	- 将更新的变量 dump 到 json 文件中。

* 性能和稳定度总是相对的！	