### A Pluto.jl notebook ###
# v0.19.32

#> [frontmatter]
#> title = "Julia 基础"
#> date = "2023-12-09"
#> description = "介绍Julia的基本语法"
#> 
#>     [[frontmatter.author]]
#>     name = "陈伟凯"
#>     url = "https://weikaichen.gitlab.io/"

using Markdown
using InteractiveUtils

# ╔═╡ fdb1f332-07aa-4151-b19b-ef7ac9320392
begin
	using PlutoUI
	TableOfContents(title="📚目录", depth = 3)
end

# ╔═╡ f7f4fd59-da09-404e-ad62-428d3122fdc5
id = "20231209" 

# ╔═╡ ce899fc3-f69e-41e5-b24d-3d8a3517c9cb
lastname = "陈"

# ╔═╡ 5982fabc-b8c4-4bd6-94a9-dd489524d11f
firstname = "某某"

# ╔═╡ 5acb9cfe-fa98-475f-bd17-3c7139ad9f70
md"""
!!! tips "查看帮助信息"
	你可以通过左下方的 **Live Docs** 查看光标所在处的函数或命令的帮助信息。
"""

# ╔═╡ 4c86b2a2-1e64-48d8-af20-e277892257f3
md"""
!!! tips "请AI帮忙"
	除了查看帮助文档以外，你还可以使用诸如ChatGPT、迅飞星火等工具。
"""

# ╔═╡ 50faf2f0-cd5b-435a-bad7-ea52036f559d
md"""
### 1. 字符串(String)

"""

# ╔═╡ e164cfde-b6e9-48bb-9d44-94a0815db1f9
fullname = lastname * firstname

# ╔═╡ 1fef0dc0-92aa-11ee-09c2-135124aaf0ae
md"""
# Julia 基础

[**陈伟凯**](https://weikaichen.gitlab.io/)·中国人民大学经济学院·2023/12/9


本节主要介绍Julia编程语言的基本命令和语法。

## 一、 Julia 变量

下面我们通过一些简单的例子来介绍Julia语言一些基本的变量类型和运算。

!!! warning "注意"
	请在Pluto Notebook中完成练习，我们将根据同学们最后提交的Notebook给成绩，请修改后面的代码，确保你的姓名和学号在下表中正确显示


| 姓名 | 学号|
|:---|----:
| $fullname | $id    |
"""

# ╔═╡ 5364fcd1-3b36-4916-a25d-99dd32a3a6bd
typeof(fullname)

# ╔═╡ f65fde55-4ba3-43e0-8579-ffeb0e0ead20
length(fullname)

# ╔═╡ a7bb5591-aef5-478f-8199-d7776c3fb1a8
fullname[1] 

# ╔═╡ c1946168-4cbe-4195-8341-80bb7efb2649
typeof(id)

# ╔═╡ a63b5cab-fb23-471e-ac2a-237982eec1a3
findfirst('0',id)

# ╔═╡ 388f155a-a381-436e-93d1-09d35b0b27be
findlast('0',id)

# ╔═╡ e52ef7cf-af0e-4fe5-822d-d983adca2b5f
occursin("陈",fullname)

# ╔═╡ 21eeb33b-433d-4fe2-9060-70986b364465
repeat(fullname * "是个好学生!",3)

# ╔═╡ 317706c4-b97c-4ab8-8c4c-030dee6eb7fa
join([lastname, firstname, "的学号是",id])

# ╔═╡ 45587dc1-d026-41ad-be78-a661c5c0ed48
md"""
### 2. 数值类型及运算

| Expression | Name           | Description                             |
|:---------- |:-------------- |:----------------------------------------|
| `-x`       | unary minus    | maps values to their additive inverses  |
| `x + y`    | binary plus    | performs addition                       |
| `x - y`    | binary minus   | performs subtraction                    |
| `x * y`    | times          | performs multiplication                 |
| `x / y`    | divide         | performs division                       |
| `x ÷ y`    | integer divide | x / y, truncated to an integer          |
| `x \ y`    | inverse divide | equivalent to `y / x`                   |
| `x ^ y`    | power          | raises `x` to the `y`th power           |
| `x % y`    | remainder      | equivalent to `rem(x, y)`               |
"""

# ╔═╡ 959d6fe7-8307-440e-8585-56195d45de6d
id_number = parse(Int,id)

# ╔═╡ d2f883f0-84e3-4ba7-a462-a32f5bc6920f
typeof(id_number)

# ╔═╡ bac73069-3977-4783-9385-e572ca428d9f
α = id_number ÷ 200000 #div, type "\div" then "Tab"

# ╔═╡ d7d3e158-b492-426b-8180-f26c27ce1510
β = id_number / 200000

# ╔═╡ fa9c756a-115d-4179-a5af-5bf95d566e6d
ceil(β)

# ╔═╡ 0a15d50b-0456-477a-b3ad-e3b21725ef72
floor(β)

# ╔═╡ 84bb1ecb-e914-4e44-ab1e-19d3e4873891
γ = α + 2im #复数

# ╔═╡ 563787f9-347b-4c91-aba2-2baa369664e4
γ^2 + β

# ╔═╡ 335a4e2d-819d-4b37-a3ae-b0fe7232f06e
q = α//3 # 有理数 

# ╔═╡ 061745d9-cb08-4483-b018-7dd5f805559f
q + α 

# ╔═╡ a10b519e-b01a-4dc5-9697-f5fd2371a6fd
q != α / 3

# ╔═╡ 0fd62ea5-c933-49ff-b48f-a062158b10d5
md"""
### 3. Bool类型及逻辑运算

| Expression | Name                                                    |
|:---------- |:--------------------------------------------------------|
| `!x`       | negation                                                |
| `x && y`   | [short-circuiting and](@ref man-conditional-evaluation) |
| `x \|\| y` | [short-circuiting or](@ref man-conditional-evaluation)  |
"""

# ╔═╡ ef63b02c-df66-4baa-a3bb-4f893c6d5daa
chen = fullname[1] == '陈'

# ╔═╡ a5be7338-a89e-46cb-9f62-19388d210a1c
typeof(chen)

# ╔═╡ 42285933-d330-47fa-9ce7-8880006265d3
2>5 && 3>1

# ╔═╡ 51f35a9f-ed69-4bb8-85a9-3074d2c2e54a
md"""
### 4. Tuple和Array等
"""

# ╔═╡ 3f82f738-493b-4e11-8f95-6317b9b6acf0
student = (lastname, firstname, id)

# ╔═╡ b04352c6-b406-41d5-b846-504958ea0ce5
join(student)

# ╔═╡ 10461003-9048-481d-bf10-893bf8719878
student1 = (姓 = lastname, 名 = firstname, 学号 = id)

# ╔═╡ 42990a14-9b67-4454-a299-be0034f15396
typeof(student1)

# ╔═╡ 4ef07e44-116e-4fb1-b651-64402ab90458
student1[:姓]

# ╔═╡ 41d8e3c3-0b8e-4a80-9281-16bd573ddd2b
student1.名

# ╔═╡ afd13a00-60a2-4704-837c-d7ceb56e5c09
Dict([("姓名",fullname),("学号",id)])

# ╔═╡ ae160e15-194d-4a3f-bb86-8aed88045bde
vect = [α, β, γ, q]

# ╔═╡ 4ed3b750-0a8d-4c1a-b244-b964c6954ca3
typeof(vect)

# ╔═╡ 2146650f-5fb7-4770-93be-d99533b1471d
abs(γ)

# ╔═╡ 74e4bb53-1f56-4db6-9fda-1de9ef07ef46
abs.(vect)

# ╔═╡ 98d5b4bd-0c23-4d07-a969-b0d38bcfa371
[abs(x) for x in vect]

# ╔═╡ 69b067ac-ddd3-488e-9608-d51a4621e6a0
map(abs,vect)

# ╔═╡ 372297cb-0d40-4023-a41a-b452f350266f
map(x -> abs(x/2), vect)

# ╔═╡ f7761e38-ba53-4f6f-a44d-0ed8f7732b22
vect[2:3]

# ╔═╡ 221dc670-003a-41d1-bf93-403645a89133
md"""
## 二、 Julia 基本语法结构

### 1. 条件语句

```julia
if condition
	statement
end
```
或者
```julia
if condition1
	statement1
else condition2
	statement2
end
```
也可以简单地写成
```julia
ifelse(condition, statement1, statement2) 
```
如果有更多的条件可以用 `elseif`
```julia
if thing
    
elseif another_thing
    . . .
elseif another_thing2
    . . . 
else
    . . . # Runs if all above are false
end
```


"""

# ╔═╡ 1e4ef45f-3169-4cc4-aca9-ab8b98c7265f
md"""
### 2. 循环

- `for` loop
  - Array： `for i in [1, 2, 3]`
  - Ranges of numbers: `for i in 1:10`
  - Strings: `for character in "howdy partner"`
  - Dictionaries: `for pair in Dict(:a => 1, :b => 2)`

- `while` loop
```julia 
value = 0
epsilon = 1e-8

while loss_function(value) >= epsilon
    . . . # Do some mathy stuff
    value = new_value
end
```
- `break` 和 `continue`： 跳出循环或继续，可能会影响可读性，也可以用条件语句替代

"""

# ╔═╡ fd95d15b-e7dc-4cb9-ae7e-ef0a61876f52
md"""
### 3. 函数

```julia
function your_funciton(input)
	some stuff
	return output
end
```
"""

# ╔═╡ 4f057d57-3d5a-4a8e-841a-b3d99d1b72f6
function mysum(x,y)
	return x + y
end

# ╔═╡ b83d9359-7f65-4274-b4eb-000f59333a7d
myproduct(x,y) = x * y

# ╔═╡ 8c06fe67-7a48-4fb1-8134-26799bdba392
md"""
!!! info "练习"
	请完修改以下代码，写一个高阶函数，即返回值是一个函数

``g(x; t_0,t_1,t_2,t_3) = t_0 + t_1 x + t_2 x^2 + t_3 x^3``
"""

# ╔═╡ 05b5c240-8c76-4cff-84a4-6246705e3a99
function g(x, t0, t1, t2, t3)
	#what to do?
	return "请修改"
end

# ╔═╡ 11620f52-b917-4010-9e52-3464c02251e7
h(x) = g(x, 4, -3, 2, 10)

# ╔═╡ af7e8cb7-25b6-4ac6-9a79-0d048f570a4e
md"""
#### 递归函数
"""

# ╔═╡ 5a768288-bf52-41d0-96ca-f5da6ab0ab22
function factorial(n)
    if n == 0
        return 1
    else
        return n * factorial(n - 1)
    end
end

# ╔═╡ a487a1ba-1f5e-4ef1-bf98-bd1456b57f21
factorial(5)

# ╔═╡ 313f118c-71ca-4252-9ae7-99a333e3561f
md"""
## 三、 随堂作业
写一个程序，给出汉诺塔（Tower of Hanoi）的解法。要第一根杆上所有的盘子都移动到最后一杆上，并仍保持原有顺序叠好。每次只能移动一个盘子，操作过程中盘子可以置于任一杆上，但任何时候都不能将一个较大的盘子放在较小的盘子上面。

![towerofhanoi](https://upload.wikimedia.org/wikipedia/commons/0/07/Tower_of_Hanoi.jpeg)
"""

# ╔═╡ c51107a2-7f21-4aac-a986-47eb9b77f390
md"""
这里假定有8个盘子，你在尝试时可以改为2或3。
"""

# ╔═╡ 3cc8c0fe-5474-4ac5-8da6-5cb9513088b1
num_disks = 8

# ╔═╡ e2f80ed1-7944-4b52-b8a8-30dd0e88be65
all_disks = 1:num_disks

# ╔═╡ f8749ad0-2109-4cb4-ba71-1d444ebfdd0d
first_stack = collect(all_disks)

# ╔═╡ c261e9b2-ba0b-4a8f-ac45-c54845763cef
starting_stacks = [first_stack, [], []]

# ╔═╡ 14801063-db6c-454d-8ddd-e4ff67a24282
md"""
我们希望得到的解是类似以下的数组，其中`(1,2)`代表先把位置1的盘子放到位置2。
"""

# ╔═╡ 18ed7cb7-3588-48a1-a646-f7ce0909e011
function wrong_solution(stacks)::Array{Tuple{Int, Int}}
	return [(1,2), (2,3), (2,1), (1,3)]
end

# ╔═╡ 73d27cf1-2d35-4fa9-9612-251d466c577d
md"""
请修改下面的函数 `solve`
"""

# ╔═╡ 843360e4-d552-41cc-8884-0af7de9fcdbd
function solve(start = starting_stacks)::Array{Tuple{Int, Int}}
	#what to do?
	#return []
end

# ╔═╡ e1924da2-56ef-4802-a8e4-cc0d2ed27d43
function iscomplete(stacks)
	last(stacks) == all_disks
end

# ╔═╡ 923bdf97-f652-4484-ae3e-ffc9a5b99fb1
function islegal(stacks)
	order_correct = all(issorted, stacks)
	
	#check if we use the same disk set that we started with
	
	disks_in_state = sort([disk for stack in stacks for disk in stack])
	disks_complete = disks_in_state == all_disks
	
	order_correct && disks_complete
end

# ╔═╡ 6d3127be-7353-4ed8-b600-e71ef3736d96
function move(stacks, source::Int, target::Int)
	#check if the from stack if not empty
	if isempty(stacks[source])
		error("Error: attempted to move disk from empty stack")
	end
	
	new_stacks = deepcopy(stacks)
	
	disk = popfirst!(new_stacks[source]) #take disk
	pushfirst!(new_stacks[target], disk) #put on new stack
	
	return new_stacks
end

# ╔═╡ 269fc1ae-834c-4bbe-a5a7-d8f763ac2c85
function run_solution(solver::Function, start = starting_stacks)
	moves = solver(deepcopy(start)) #apply the solver
	
	all_states = Vector{Any}(undef, length(moves) + 1)
	all_states[1] = start
	
	for (i, m) in enumerate(moves)
		try
			all_states[i + 1] = move(all_states[i], m[1], m[2])
		catch
			all_states[i + 1] = missing
		end
	end
	
	return all_states
end

# ╔═╡ caad2ad0-041f-4983-aae0-fc99477ef036
function check_solution(solver::Function, start = starting_stacks)
	try
		#run the solution
		all_states = run_solution(solver, start)
		
		#check if each state is legal
		all_legal = all(islegal, all_states)
		
		#check if the final state is is the completed puzzle
		complete = (iscomplete ∘ last)(all_states)
		
		all_legal && complete
	catch
		#return false if we encountered an error
		return false
	end
end

# ╔═╡ 042b1810-2ac8-41fd-8547-9853475e4df0
check_solution(solve)

# ╔═╡ 5db44c55-5556-44d5-9bcf-2423ba73932d
keep_working(text=md"The answer is not quite right.") = Markdown.MD(Markdown.Admonition("danger", "Keep working on it!", [text]));

# ╔═╡ 7d06877a-976a-44d4-8972-8c66b214c412
correct(text=md"Great! You got the right answer! Let's move on to the next section.") = Markdown.MD(Markdown.Admonition("correct", "Got it!", [text]));

# ╔═╡ cddb9b21-fc1a-479c-887e-6f0442ec6305
if  h(1)!= 13
	keep_working()
else
	correct(md"""**Great!**  You figured it out.  Keep going.""")
end

# ╔═╡ 85b45664-20fe-4354-9a6c-6759e9b26af2
if  !check_solution(solve)
	keep_working()
else
	correct(md"""**Great!**  You figured it out.  Keep going.""")
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.54"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.4"
manifest_format = "2.0"
project_hash = "3c61004d0ad425a97856dfe604920e9ff261614a"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "793501dcd3fa7ce8d375a2c878dca2296232686e"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.2.2"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.5+0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "7134810b1afce04bbc1045ca1985fbe81ce17653"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.5"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "d75853a0bdbfb1ac815478bacd89cd27b550ace6"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.3"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.4"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "8.4.0+0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.11.0+1"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.2+0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.10.11"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.21+4"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "a935806434c9d4c506ba941871b327b96d41f2bf"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.8.0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.9.2"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "bd7c69c7f7173097e7b5e1be07cee2b8b7447f51"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.54"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "03b4c25b43cb84cee5c90aa9b5ea0a78fd848d2f"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.2.0"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "00805cd429dcb4870060ff49ef443486c262e38e"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.4.1"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["Libdl", "LinearAlgebra", "Random", "Serialization", "SuiteSparse_jll"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.9.0"

[[deps.SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "Pkg", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "5.10.1+6"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.Tricks]]
git-tree-sha1 = "eae1bb484cd63b36999ee58be2de6c178105112f"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.8"

[[deps.URIs]]
git-tree-sha1 = "67db6cc7b3821e19ebe75791a9dd19c9b1188f2b"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.5.1"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.8.0+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.52.0+1"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"
"""

# ╔═╡ Cell order:
# ╟─1fef0dc0-92aa-11ee-09c2-135124aaf0ae
# ╠═f7f4fd59-da09-404e-ad62-428d3122fdc5
# ╠═ce899fc3-f69e-41e5-b24d-3d8a3517c9cb
# ╠═5982fabc-b8c4-4bd6-94a9-dd489524d11f
# ╟─5acb9cfe-fa98-475f-bd17-3c7139ad9f70
# ╟─4c86b2a2-1e64-48d8-af20-e277892257f3
# ╟─50faf2f0-cd5b-435a-bad7-ea52036f559d
# ╠═e164cfde-b6e9-48bb-9d44-94a0815db1f9
# ╠═5364fcd1-3b36-4916-a25d-99dd32a3a6bd
# ╠═f65fde55-4ba3-43e0-8579-ffeb0e0ead20
# ╠═a7bb5591-aef5-478f-8199-d7776c3fb1a8
# ╠═c1946168-4cbe-4195-8341-80bb7efb2649
# ╠═a63b5cab-fb23-471e-ac2a-237982eec1a3
# ╠═388f155a-a381-436e-93d1-09d35b0b27be
# ╠═e52ef7cf-af0e-4fe5-822d-d983adca2b5f
# ╠═21eeb33b-433d-4fe2-9060-70986b364465
# ╠═317706c4-b97c-4ab8-8c4c-030dee6eb7fa
# ╟─45587dc1-d026-41ad-be78-a661c5c0ed48
# ╠═959d6fe7-8307-440e-8585-56195d45de6d
# ╠═d2f883f0-84e3-4ba7-a462-a32f5bc6920f
# ╠═bac73069-3977-4783-9385-e572ca428d9f
# ╠═d7d3e158-b492-426b-8180-f26c27ce1510
# ╠═fa9c756a-115d-4179-a5af-5bf95d566e6d
# ╠═0a15d50b-0456-477a-b3ad-e3b21725ef72
# ╠═84bb1ecb-e914-4e44-ab1e-19d3e4873891
# ╠═563787f9-347b-4c91-aba2-2baa369664e4
# ╠═335a4e2d-819d-4b37-a3ae-b0fe7232f06e
# ╠═061745d9-cb08-4483-b018-7dd5f805559f
# ╠═a10b519e-b01a-4dc5-9697-f5fd2371a6fd
# ╟─0fd62ea5-c933-49ff-b48f-a062158b10d5
# ╠═ef63b02c-df66-4baa-a3bb-4f893c6d5daa
# ╠═a5be7338-a89e-46cb-9f62-19388d210a1c
# ╠═42285933-d330-47fa-9ce7-8880006265d3
# ╟─51f35a9f-ed69-4bb8-85a9-3074d2c2e54a
# ╠═3f82f738-493b-4e11-8f95-6317b9b6acf0
# ╠═b04352c6-b406-41d5-b846-504958ea0ce5
# ╠═10461003-9048-481d-bf10-893bf8719878
# ╠═42990a14-9b67-4454-a299-be0034f15396
# ╠═4ef07e44-116e-4fb1-b651-64402ab90458
# ╠═41d8e3c3-0b8e-4a80-9281-16bd573ddd2b
# ╠═afd13a00-60a2-4704-837c-d7ceb56e5c09
# ╠═ae160e15-194d-4a3f-bb86-8aed88045bde
# ╠═4ed3b750-0a8d-4c1a-b244-b964c6954ca3
# ╠═2146650f-5fb7-4770-93be-d99533b1471d
# ╠═74e4bb53-1f56-4db6-9fda-1de9ef07ef46
# ╠═98d5b4bd-0c23-4d07-a969-b0d38bcfa371
# ╠═69b067ac-ddd3-488e-9608-d51a4621e6a0
# ╠═372297cb-0d40-4023-a41a-b452f350266f
# ╠═f7761e38-ba53-4f6f-a44d-0ed8f7732b22
# ╟─221dc670-003a-41d1-bf93-403645a89133
# ╟─1e4ef45f-3169-4cc4-aca9-ab8b98c7265f
# ╟─fd95d15b-e7dc-4cb9-ae7e-ef0a61876f52
# ╠═4f057d57-3d5a-4a8e-841a-b3d99d1b72f6
# ╠═b83d9359-7f65-4274-b4eb-000f59333a7d
# ╟─8c06fe67-7a48-4fb1-8134-26799bdba392
# ╠═05b5c240-8c76-4cff-84a4-6246705e3a99
# ╠═11620f52-b917-4010-9e52-3464c02251e7
# ╟─cddb9b21-fc1a-479c-887e-6f0442ec6305
# ╟─af7e8cb7-25b6-4ac6-9a79-0d048f570a4e
# ╠═5a768288-bf52-41d0-96ca-f5da6ab0ab22
# ╠═a487a1ba-1f5e-4ef1-bf98-bd1456b57f21
# ╟─313f118c-71ca-4252-9ae7-99a333e3561f
# ╟─c51107a2-7f21-4aac-a986-47eb9b77f390
# ╠═3cc8c0fe-5474-4ac5-8da6-5cb9513088b1
# ╠═e2f80ed1-7944-4b52-b8a8-30dd0e88be65
# ╠═f8749ad0-2109-4cb4-ba71-1d444ebfdd0d
# ╠═c261e9b2-ba0b-4a8f-ac45-c54845763cef
# ╟─14801063-db6c-454d-8ddd-e4ff67a24282
# ╠═18ed7cb7-3588-48a1-a646-f7ce0909e011
# ╟─73d27cf1-2d35-4fa9-9612-251d466c577d
# ╠═843360e4-d552-41cc-8884-0af7de9fcdbd
# ╠═042b1810-2ac8-41fd-8547-9853475e4df0
# ╟─85b45664-20fe-4354-9a6c-6759e9b26af2
# ╟─e1924da2-56ef-4802-a8e4-cc0d2ed27d43
# ╟─923bdf97-f652-4484-ae3e-ffc9a5b99fb1
# ╟─6d3127be-7353-4ed8-b600-e71ef3736d96
# ╟─269fc1ae-834c-4bbe-a5a7-d8f763ac2c85
# ╟─caad2ad0-041f-4983-aae0-fc99477ef036
# ╟─fdb1f332-07aa-4151-b19b-ef7ac9320392
# ╟─5db44c55-5556-44d5-9bcf-2423ba73932d
# ╟─7d06877a-976a-44d4-8972-8c66b214c412
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
