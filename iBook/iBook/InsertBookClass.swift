//
//  InsertBookClass.swift
//  iBook
//
//  Created by benzoin_testtube on 2022/5/28.
//
//  用于在一开始将书本信息导入数据库，使用后不再使用

import UIKit

class InsertBookClass: NSObject {
    let sqt = SqliteTool()
    func insertBook()
    {
        //sqt.execute(sql: "INSERT INTO book(bid,bname,author,intro,price,cover,type) VALUES('001','计算机组成原理','Alan Clements','本书由资深的计算机体系结构教育家Alan Clements博士编写，原书名为《计算机体系结构：原理与演变》（Computer Organization & Architecture: Themes and Variations），书中不仅覆盖单机系统的组成原理和系统结构的各个方面，还包括计算机的性能评价方法以及多发射、粗粒度并行等内容。作者希望本书能够适合电子工程（EE）、电子与计算机工程（ECE）、计算机科学（CS）等不同专业的教学需要。书中围绕基本概念、指令集体系结构、处理器组成和能效、存储与外设以及处理器级并行等五个核心问题将这些内容有条不紊地组织在一起，以便满足不同专业的教学需要。 中文版引进的时候综合考虑国内高校“计算机组成与结构”或类似课程的教学目标以及我们对本书的定位，对原书进行了适当裁剪和重新组合，分为两册：《计算机组成原理》和《计算机存储与外设》。 本书即为《计算机组成原理》，涵盖原书前三部分，共6章，主要介绍计算机系统的组成和体系结构的基本概念、指令系统以及处理器实现等涉及计算机组成原理课程的内容。','79.00','https://img.alicdn.com/imgextra/i4/1599634638/TB24YWjhHJkpuFjy1zcXXa5FFXa-1599634638.jpg','工具应用')")
        //sqt.execute(sql: "INSERT INTO book(bid,bname,author,intro,price,cover,type) VALUES('002','数据结构教程','李春葆','本书在前4版的基础上针对教育部新的考研大纲和大量读者来信提出的要求进行了修订。本书共13章，内容包括绪论、线性表、栈和队列、串、递归、数组和广义表、树和二叉树、图、查找、内排序、外排序和文件等，书中给出了大量练习题和各类上机实验题，每个知识点都配有视频讲解。  本书内容全面，知识点翔实，条理清晰，讲解透彻，实例丰富，实用性强，适合高等院校计算机和相关专业的本科生及研究生使用。','47.60','https://img.alicdn.com/imgextra/i2/1614846122/TB1AaYDkgmTBuNjy1XbXXaMrVXa_!!0-item_pic.jpg_430x430q90.jpg','教材教辅')")
        //sqt.execute(sql: "INSERT INTO book(bid,bname,author,intro,price,cover,type) VALUES('003','脂砚斋批评本红楼梦','曹雪芹','满纸荒唐言，一把辛酸泪！都云作者痴，谁解其中味？一部妇孺皆知的《红楼梦》可谓凝聚了曹雪芹一生的心血。小说以贾宝玉、林黛玉的爱情悲剧为主线，驾构出了贾、王、史、薛四大家族的兴衰史。鲜活的人物、凄美的爱情，是一部读不完、说不尽的千古奇书。本书所据底本，是现存十一种《红楼梦》古抄本中完整、真切地保存了曹雪芹生前定本原貌的一种，不仅可以从中领略作者原定本的真实风貌，还可以直接品味到作者的“红颜知己”脂砚斋在庚辰原本上留下的2100余条珍贵批语，具有独特的艺术欣赏价值、学术研究价值和版本珍藏价值。','78.00','https://img.alicdn.com/imgextra/i2/380693186/TB2sL3tb6ZnyKJjSZPcXXXqHVXa_!!380693186.jpg_430x430q90.jpg','文学作品')")
        //sqt.execute(sql: "INSERT INTO book(bid,bname,author,intro,price,cover,type) VALUES('004','Unity3D完全自学教程','马遥','Unity 作为一个成熟的游戏引擎，其设计和使用都是有层次的。本书共 13 章，第 1 章至第 3 章为基础知识部分，主要介绍 Unity 的基本操作、基本概念、编写脚本的方法、导入和使用资源的方法，学完这部分内容后，你已经可以做出很多有趣的小游戏了。第 4 章至第 11 章主要介绍 Unity 重要的系统模块、功能，包括物理系统、UI 界面系统、动画系统、3D 数学基础、场景管理、导航系统、着色器系统、打包与发布等，读完以后可以掌握高级的开发技术并解决实际问题。第 12 章和第 13 章是两个有代表性的 Unity游戏示例，一个是 3D 跑酷游戏，另一个是 2D 的弹球游戏，综合展示了 Unity 的大部分功能，具有较强的代表性。除了这些内容，每章都会有一些小的示例，以方便大家实践并理解具体概念。由于实例部分的内容操作流程较多，不易用图文展现，本书还特别附赠了视频教程来方便读者学习。本书适合广大 Unity 初学者入门时使用，也适合 Unity 用户查阅和参考软件具体的使用方法、注意事项等，所以也可以作为一本 Unity 的参考手册使用。','89.00','https://img.alicdn.com/imgextra/i1/1932014659/O1CN019uyjdT1kHrwp3qQzN_!!1932014659.jpg_430x430q90.jpg','工具应用')")
        //sqt.execute(sql: "INSERT INTO book(bid,bname,author,intro,price,cover,type) VALUES('005','王道考研计算机网络复习指导','王道论坛','本书是计算机专业研究生入学考试计算机网络课程的复习用书，内容包括计算机网络体系结构、物理层、数据链路层、网络层、传输层、应用层等。本书严格按照*新计算机考研大纲的计算机网络部分编写，对大纲所涉及的知识点进行集中梳理，力求内容精炼、重点突出、深入浅出。本书精选各名校的历年考研真题，并给出详细的解题思路，力求实现讲练结合、灵活掌握、举一反三的功效。','69.00','https://img.alicdn.com/imgextra/i2/1932014659/O1CN01O4iZm21kHs15gjfrV_!!1932014659.jpg_430x430q90.jpg','教材教辅')")
       // sqt.execute(sql: "INSERT INTO book(bid,bname,author,intro,price,cover,type) VALUES('006','Fate/Prototype 苍银的碎片','樱井光','本作内容讲述了七名魔术师各与七位英灵分别签下契约，为能得到实现任何愿望的圣杯而展开战斗，执行名为“圣杯战争”的仪式。在这次圣杯战争中，魔术师——沙条绫香与英灵剑兵结下了契约。随即绫香遭遇重大的危机，不过她并没有因此受到打击，与剑兵一起突破了重重困难，化解了危机。','101.00','https://img.alicdn.com/imgextra/i1/612746299/O1CN01c8SlPq1wOzVRmEhUg_!!0-item_pic.jpg_430x430q90.jpg','文学作品')")
        //sqt.execute(sql: "INSERT INTO book(bid,bname,author,intro,price,cover,type) VALUES('007','东方Project人物名鉴 宵暗篇','ZUN','《东方Project人物名鉴 宵暗篇》收录了《东方红魔乡》《东方永夜抄》《东方地灵殿》《东方星莲船》《东方绀珠传》《东方凭依华》等作品，共60名角色的设定资料与解说，对想要接触“东方”却又无从下手的朋友来说，是一本十分推荐的入门读物。对系列爱好者来说，也能从原作者ZUN以及各位画师创作时的心路历程中收获不少乐趣。','75.00','https://img.alicdn.com/imgextra/i2/612746299/O1CN014hLEEC1wOzWamkWN5_!!0-item_pic.jpg_430x430q90.jpg','文学作品')")
        //sqt.execute(sql: "INSERT INTO book(bid,bname,author,intro,price,cover,type) VALUES('008','明日方舟纪念插画集Vol.2','鹰角网络','鹰角网络再度邀请60余位插画师精心绘制近70幅高质量作品，收录成册作为《明日方舟》的特别献礼。大16开软精装，高画质全彩印刷，特种纸呈现高级质感，极具欣赏与收藏价值。为答谢各位博士一直以来的支持，插画集随书附赠专属赠品：PVC典藏书签4张、精美海报1张。','88.00','https://img.alicdn.com/imgextra/i3/612746299/O1CN01RYfmno1wOzXXwc0Fm_!!0-item_pic.jpg_430x430q90.jpg','文学作品')")
        //sqt.execute(sql: "INSERT INTO book(bid,bname,author,intro,price,cover,type) VALUES('009','基础有机化学第四版','邢其毅','到达世界最高点，安息香酸缩合反应！太好玩啦有机化学，还是看看远处的计算机吧家人们','212.00','https://img.alicdn.com/imgextra/i3/101450072/O1CN01cTa38D1CP1GAM0Q4s-101450072.jpg_430x430q90.jpg','教材教辅')")
    }
}

