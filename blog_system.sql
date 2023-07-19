/*
 Navicat Premium Data Transfer

 Source Server         : tomato
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : blog_system

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 21/06/2023 12:39:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '文章标题',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '文章具体内容',
  `created` date NOT NULL COMMENT '发表时间',
  `modified` date NULL DEFAULT NULL COMMENT '修改时间',
  `categories` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '默认分类' COMMENT '文章分类',
  `tags` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文章标签',
  `allow_comment` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否允许评论',
  `thumbnail` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文章缩略图',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES (14, 'Spring Boot 入门教程', '一、Spring Boot 是什么\r\n以下截图自 Spring Boot 官方文档：\r\n\r\n什么是Spring Boot\r\n\r\n翻译整理一下，内容如下：\r\n\r\nSpring Boot 是基于 Spring 框架基础上推出的一个全新的框架, 旨在让开发者可以轻松地创建一个可独立运行的，生产级别的应用程序。\r\n\r\n基于 Spring Boot 内部的自动化配置功能，开发者可以在\"零\"配置, 或者只需要添加很少的配置，就可以进行日常的功能开发。\r\n\r\n二、为什么要使用 Spring Boot\r\n用权威说话，下图同样截图自 Spring Boot 官方文档：\r\n\r\n为什么要使用Spring Boot\r\n\r\n我们再来翻译整理一下，内容如下：\r\n\r\n1、能够轻松、方便地创建一个 Spring 应用;\r\n2、直接使用内嵌的 Tomcat, Jetty, Undertow 容器（无需再手动安装容器，通过部署 WAR 包的方式）;\r\n3、内部自动管理各种 Jar 包的版本依赖关系，再也不用为版本冲突而烦恼啦；\r\n4、自动化配置 Spring 相关功能，以及第三方库;\r\n5、提供诸如指标，健康检查, 外部化配置等功能；\r\n6、\"零配置\"，再也不需要手写地狱般的 XML 配置了；\r\n怎么样，看了 Spring Boot 这些强大的特性以后，是不是开始跃跃欲试了，接下来，让我们快速入门 Spring Boot 吧 ！\r\n\r\nPS: 正由于 Spring Boot 以上特性，才得以使它成为构建微服务架构的基础组件。\r\n\r\n三、快速入门\r\n3.1 创建 Spring Boot 项目\r\n3.1.1 通过 Spring Initializr 来创建\r\n1、访问 Spring Initializr 地址：https://start.spring.io：\r\nSpring Initializr\r\n\r\n默认情况下，Spring Initializr 生成的项目是通过 Maven 来构建的，开发语言为 Java, 版本用的最新的发行版，打包方式为 Jar, 使用的 Java 版本为 1.8，小伙伴们这里要注意一下！\r\n\r\n2、生成项目, 导入到开发工具中\r\n点击 Generate Project 按钮，下载的 Demo.zip， 解压后，导入到开发工具中，这里笔者使用的是 IntelliJ IDEA。\r\n\r\n3、File -> New -> Model from Existing Source, 可参考下图:\r\n导入Spring Boot项目\r\n\r\n4、弹出框中，选中您的解压后的文件夹 -> OK -> 选择通过 Maven 的方式来导入项目:\r\n通过Maven的方式来导入Spring Boot项目\r\n\r\n5、一路点击 Next -> Finished;\r\n至此，通过 Spring Initializr 网站来创建应用，并导入到了我们的开发工具 IntelliJ IDEA 中就成功了。\r\n\r\nPS: 如果您使用的是 Eclipse, 方式是 Import -> Existing Maven Projects -> Next -> 选择解压后的文件夹 -> Finsh\r\n\r\n3.1.2 通过 IntelliJ IDEA 来创建应用\r\n其实，我们还可以直接通过 IntelliJ IDEA 来创建一个 Spring Boot 项目，因为 IntelliJ IDEA 内置了 Spring Initializr，接下来，通过图文，让我们来看下要如何一步一步操作：\r\n\r\n1、File -> New -> Project, 跳出新建项目弹出框:\r\n新建Spring Boot弹出框\r\n\r\n2、点击 Next，弹出填写 maven 项目的需要的相关信息，这里我们用默认的就好了，继续点击 Next；\r\n3、再次弹出框，这里可以勾选开发中需要的 Starter 的组件, 如 Web, Redis 等，我们这里暂时不勾，后面通过手动添加的方式， 继续点击 Next -> Finish；\r\n3.2 项目结构\r\n项目创建成功后，可以看到结构如下：\r\n\r\nSpring Boot项目结构\r\n\r\n共分为三个主要的文件夹：\r\n\r\nsrc/mail/java: 存放 Java 源码，包括启动程序的入口；\r\nsrc/mail/resources: 资源目录，用于放置相关配置文件，静态文件 html, css 等;\r\nsrc/test/java: 存放单元测试类\r\n3.3 引入 Web 依赖\r\n在 pom.xml 文件中添加 web 依赖：\r\n\r\n<dependency>\r\n    <groupId>org.springframework.boot</groupId>\r\n    <artifactId>spring-boot-starter-web</artifactId>\r\n</dependency>\r\nPS: 不用手动去指定版本号，因为 Spring Boot 内部已经维护相关 Jar 包的依赖关系。\r\n\r\n3.4 编写第一个接口\r\n在 com.example.demo 包下添加 controller 包，用来存放所有对外部开发的接口, 完成后，创建 HelloController.java 类, 添加一个 /hello 接口:\r\n\r\n@RestController\r\npublic class HelloController {\r\n\r\n    @GetMapping(\"/hello\")\r\n    public String hello() {\r\n        return \"Hello, Spring Boot !\";\r\n    }\r\n}\r\n添加 @RestController 注解，表示此类中所有定义的接口均为 RESTFul 风格，也就是说返参均为 JSON 格式的。\r\n\r\n@GetMapping(\"/hello\") 表示定义一个 GET 请求的接口，路径为 /hello。\r\n\r\n3.5 启动程序，验证效果\r\n启动Spring Boot\r\n\r\n根据图示，点击按钮，来启动 Spring Boot Web 程序, 查看控制台输出：\r\n\r\n  .   ____          _            __ _ _\r\n /\\\\ / ___\'_ __ _ _(_)_ __  __ _ \\ \\ \\ \\\r\n( ( )\\___ | \'_ | \'_| | \'_ \\/ _` | \\ \\ \\ \\\r\n \\\\/  ___)| |_)| | | | | || (_| |  ) ) ) )\r\n  \'  |____| .__|_| |_|_| |_\\__, | / / / /\r\n =========|_|==============|___/=/_/_/_/\r\n :: Spring Boot ::        (v2.1.4.RELEASE)\r\n\r\n2019-04-14 19:57:59.795  INFO 3680 --- [           main] com.example.demo.DemoApplication         : Starting DemoApplication on 192.168.0.100 with PID 3680 (/Users/a123123/Work/IdeaProjects/demo/target/classes started by allen-jiang in /Users/a123123/Work/IdeaProjects/demo)\r\n2019-04-14 19:57:59.798  INFO 3680 --- [           main] com.example.demo.DemoApplication         : No active profile set, falling back to default profiles: default\r\n2019-04-14 19:58:00.666  INFO 3680 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8080 (http)\r\n2019-04-14 19:58:00.689  INFO 3680 --- [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]\r\n2019-04-14 19:58:00.689  INFO 3680 --- [           main] org.apache.catalina.core.StandardEngine  : Starting Servlet engine: [Apache Tomcat/9.0.17]\r\n2019-04-14 19:58:00.756  INFO 3680 --- [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext\r\n2019-04-14 19:58:00.757  INFO 3680 --- [           main] o.s.web.context.ContextLoader            : Root WebApplicationContext: initialization completed in 920 ms\r\n2019-04-14 19:58:00.978  INFO 3680 --- [           main] o.s.s.concurrent.ThreadPoolTaskExecutor  : Initializing ExecutorService \'applicationTaskExecutor\'\r\n2019-04-14 19:58:01.183  INFO 3680 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 8080 (http) with context path \'\'\r\n2019-04-14 19:58:01.186  INFO 3680 --- [           main] com.example.demo.DemoApplication         : Started DemoApplication in 1.678 seconds (JVM running for 2.176)\r\n\r\n当控制台日志中输出了 Tomcat started on port(s): 8080 (http) with context path \'\'时，表示内嵌的 Tomcat 容器已经启动成功了，端口为 8080 ！\r\n\r\n接下来，我们在浏览器上访问 http://localhost:8080/hello 接口，验证一下，接口是否能够正常访问：\r\n\r\n请求 /hello 接口\r\n\r\n返回了我们想要的 Hello, Spring Boot ! 字符串，接口访问正常，大工告成！\r\n\r\n四、总结\r\n本文中，我们首先了解了什么是 Spring Boot, 以及Spring Boot 的相关特性，最后我们手把手学习了如何搭建一个 Spring Boot 项目，并编写了第一个接口且访问成功。\r\n\r\n通过实际操作，真切地感受到了 Spring Boot 的魅力所在！老铁，双击 666！\r\n\r\n五、GitHub 示例代码\r\nhttps://github.com/weiwosuoai/spring-boot-tutorial/tree/master/demo\r\n\r\n六、Reference\r\nhttps://start.spring.io', '2023-06-19', NULL, '默认分类', '', 1, NULL);
INSERT INTO `t_article` VALUES (15, '许昌学院思想政治理论课  课程实践报告', '推进祖国统一，我们每个人都有自己的角色和使命，需要团结奋斗，共同开创一个更为繁荣、强大的中华民族。历史的曲折并没有削减前行的步伐，只要我们所有中华儿女紧密团结起来，就能高举中华民族伟大复兴的旗帜，振奋精神、砥砺前行，为促进祖国统一和民族复兴贡献磅礴伟力。祖国的统一是我们不可撼动的历史任务，也是我们义不容辞的责任和担当。作为新时代的青年，我们要拥有正确的价值观，勇担使命、锐意进取，以实际行动为中华民族的伟大复兴贡献自己的绵薄之力。\r\n我们的人生价值不仅仅关系到个人的幸福，更与祖国的命运息息相关。政府多年来不断为祖国统一付出了不懈努力，旨在使祖国的领土完整、国家安定。我们作为祖国的子女，更应该有责任有担当，为实现强大的祖国梦尽自己所能。只有始终保持着维护国家统一的信念，我们才能坚定自己的信心，激发自己的斗志，把握历史机遇，为中国的复兴而不懈奋斗。在我们的生活和工作中，我们应该树立正确的观念，坚持党的领导，与危害祖国的行为和人员斗争，并通过不断学习和提升自身，成为祖国建设的有用之才。\r\n中华民族伟大的复兴需要我们每一个人的共同努力。作为栋梁之才的大学生，我们更应该承担起自己的责任，坚定维护国家统一的立场，坚决抵制任何分裂祖国的言论和行为，保持内心的底线和忠诚。同时，我们也应该注重全面素质的提升，不断丰富自己的理论知识和实践经验，发挥自己在各个领域的优势，为建设强盛的中国贡献自己的力量。\r\n为实现中华民族伟大的复兴和国家统一大业，我们需要做到：高度认可自己的理想信念，树立集体主义的价值观和艰苦奋斗的精神，严格遵守组织纪律，在成长和学习中不断提升自身素质，强化民族团结的意识。只有在这种“自觉、有规律、有纪律”的环境中，我们的努力才能更好地落实到行动，构建出一个更加和谐繁荣、统一强大的祖国。\r\n一、形式策划方案\r\n1.发挥网络力量\r\n当前，移动互联网的普及率日益提高，网络成为大多数人获取信息的重要渠道，我们可以发挥自己的力量，利用网络平台为促进国家统一宣传、热议等。\r\n2.利用校内宣传阵地\r\n大学校园是形成民族自豪感和责任感的重要场所，我们可以利用学校内部各种媒体平台，如学校官方网站、微信公众号、学生会平台等，积极宣传捍卫国家统一的重要性，并在学生会和社团内部组织相关活动，向广大师生宣传。\r\n3.举办主题活动\r\n我们可以依托学校社团联谊会，围绕“共促祖国统一”这个主题，策划丰富多彩的文艺活动，如主题演讲、文化讲座、影视欣赏等，以各种形式弘扬中华民族的伟大精神，并加强青年之间的交流合作。\r\n4.参与社会公益活动\r\n我们还可以积极参与社会公益活动，如开展志愿服务、走访军营和边防等，深入了解国家的形势和国防形势，在实践中树立爱国主义的信念。\r\n二、反思\r\n干一件事不仅要知道该做什么，更要明白为何要做。在推进祖国统一的过程中，我们不能仅仅关注表面的工作和结果，还要从内在的角度进行深刻的思考和反思。\r\n1.必须树立文化自信和宝贵的民族感情\r\n面对复杂多变的形势，我们首先要树立强烈的文化自信，坚信中华民族的伟大复兴一定能够实现。同时，我们也要珍惜中华民族的宝贵民族感情，始终记得自己是中国人。\r\n2.坚定信仰并实践\r\n维护祖国统一是每个中国公民的责任和义务，作为大学生更要坚定自己的信仰，以实际行动践行自己的承诺，并向身边的人示范，扩大积极宣传的效果。\r\n3.将知识转化为行动\r\n大学生最大的特点就是对知识有更强的储备和操作能力，我们需要将这些知识转换为可执行的行动计划，让学问和实践相结合，并齐心协力为民族、为国家拼搏奋斗。\r\n4.走出属于自己的成长路径\r\n在推进祖国统一的历程中，我们更应该从自身的每一个方面出发，把累积于学习、工作、人生等各个领域的知识与经验结合起来，不断进步，在成长道路上践行我们的信仰。\r\n总之，在推进祖国统一的行动中，我们作为青年大学生有着重要的任务和责任。我们应该始终坚持为国家、为人民的利益着眼，用实际行动展示我们的信念和责任感，切实做好我们的本职工作，为祖国更加繁荣、强大和富强的未来发展尽自己的一份力量。', '2023-06-19', NULL, '默认分类', '思政', 1, NULL);
INSERT INTO `t_article` VALUES (16, '对选题“对全面依法治国的认识”的研究论文', '依法治国就是依照体现人民意志和社会发展规律的法律治理国家，而不是依照个人主义、主张治理国家；要求国家的政治、经济运作、社会各方面的活动通通依照法律进行，而不受任何个人意志的干预阻碍或破坏。简而言之，依法治国就是依照宪法和法律来治理国家，是中国共产党领导人民治理国家的基本方略，是发展社会主义市场经济的客观需要，也是社会文明进步的显著标志，还是国家长治久安的必要保障。依法治国，建设社会主义法治国家，是人民当家作主的根本保证。\r\n全面依法治国是历史的深刻启示。纵观世界近代史，凡是顺利实现现代化的国家，都较好地解决了法制和人治问题。相反一些国家陷入这样那样地“陷阱”，并没有顺利迈进现代化门槛，很大程度上与法治不彰有关。\r\n世界社会主义发展史上，不少国家没能解决好法制和人治的问题，没能跳出“人存政举，人亡政息”的人治怪圈。从我们自己来说，新中国成立以来既吃过破坏法治的苦头，也尝到了法治昌明的甜头。\r\n历史深刻启示我们，法治是治国理政的基本方式。在我们这样一个13亿多人口、56个民族的大国，要保证国家统一、法制统一、政令统一、市场统一，实现经济发展、政治清明、文化昌盛、社会公正、生态良好，必须秉持法律这个准绳、用好法治这个方式。\r\n全面依法治国是现实的迫切要求。当前，中国正经历空前深刻的社会变革。要在纷繁复杂的社会中保持稳定的秩序，在各方竞逐的市场领域维护公平的规则，在意见碰撞的观念世界坚守文明的底线，必须织密法治之网、强化法治之力。\r\n“以律均清浊，以法定治乱。”只有在法治轨道上统筹社会力量、平衡社会利益、调节社会关系、规范社会行为，化解各种社会矛盾和问题，才能顺利推进全面深化改革进程，确保我国社会在深刻变革中既生机勃勃又井然有序。\r\n全面依法治国是长远的战略谋划。现在距全面建成小康社会还有5年时间，只有靠法治，才能为党和国家事业发展提供根本性、全局性、长期性的制度保障。我们党提出全面推进依法治国，坚定不移厉行法治，一个重要意图就是为民族复兴筹、为子孙后代计、为长远发展谋。\r\n正因为如此，党的十八届四中全会强调，依法治国事关党执政兴国，事关人民幸福安康，事关党和国家长治久安。我们应该从这样的高度，充分认识全面推进依法治国的重大现实意义和深远历史意义，高高扬起依法治国的旗帜。\r\n党的十八届四中全会强调习近平法治思想内涵丰富、论述深刻、逻辑严密、系统完备，从历史和现实相贯通、国际和国内相关联、理论和实际相结合上深刻回答了新时代为什么实行全面依法治国、怎样实行全面依法治国等一系列重大问题。习近平法治思想是顺应实现中华民族伟大复兴时代要求应运而生的重大理论创新成果，是马克思主义法治理论中国化最新成果，是习近平新时代中国特色社会主义思想的重要组成部分，是全面依法治国的根本遵循和行动指南。全党全国要认真学习领会习近平法治思想，吃透基本精神、把握核心要义、明确工作要求，切实把习近平法治思想贯彻落实到全面依法治国全过程。我们不难看出党和国家对依法治国的重视以及依法治国对社会发展的重要意义。\r\n中国共产党十八届四中全会通过的《关于全面推进依法治国若干重大问题的决定》，第一次以执政党最高政治文件和最高政治决策的形式，对在新形势下进一步引导和保障中国特色社会主义建设，通过全面推进依法治国、加快建设法治中国，推进国家治理体系和治理能力现代化，在法治轨道上积极稳妥地深化各种体制改革，为全面建成小康社会、实现中华民族伟大复兴中国梦提供制度化、法治化的引领、规范、促进和保障，具有十分重要的战略意义。\r\n习近平强调，要坚持党对全面依法治国的领导，要坚持以人民为中心。党的领导是推进全面依法治国的根本保证。国际国内环境越是复杂，改革开放和社会主义现代化建设任务越是繁重，越要运用法治思维和法治手段巩固执政地位、改善执政方式、提高执政能力，保证党和国家长治久安。全面依法治国是要加强和改善党的领导，健全党领导全面依法治国的制度和工作机制，推进党的领导制度化、法治化，通过法治保障党的路线方针政策有效实施。全面依法治国最广泛、最深厚的基础是人民，必须坚持为了人民、依靠人民。要把体现人民利益、反映人民愿望、维护人民权益、增进人民福祉落实到全面依法治国各领域全过程。推进全面依法治国，根本目的是依法保障人民权益。要积极回应人民群众新要求新期待，系统研究谋划和解决法治领域人民群众反映强烈的突出问题，不断增强人民群众获得感、幸福感、安全感，用法治保障人民安居乐业。\r\n要坚持依法治国、依法执政、依法行政共同推进，法治国家、法治政府、法治社会一体建设。全面依法治国是一个系统工程，要整体谋划，更加注重系统性、整体性、协同性。法治政府建设是重点任务和主体工程，要率先突破，用法治给行政权力定规矩、划界限，规范行政决策程序，加快转变政府职能。要推进严格规范公正文明执法，提高司法公信力。普法工作要在针对性和实效性上下功夫，特别是要加强青少年法治教育，不断提升全体公民法治意识和法治素养。要完善预防性法律制度，坚持和发展新时代“枫桥经验”，促进社会和谐稳定。\r\n习近平指出，要坚持中国特色社会主义法治道路，要坚持在法治轨道上推进国家治理体系和治理能力现代化。中国特色社会主义法治道路本质上是中国特色社会主义道路在法治领域的具体体现。既要立足当前，运用法治思维和法治方式解决经济社会发展面临的深层次问题；又要着眼长远，筑法治之基、行法治之力、积法治之势，促进各方面制度更加成熟更加定型，为党和国家事业发展提供长期性的制度保障。要传承中华优秀传统法律文化，从我国革命、建设、改革的实践中探索适合自己的法治道路，同时借鉴国外法治有益成果，为全面建设社会主义现代化国家、实现中华民族伟大复兴夯实法治基础。法治是国家治理体系和治理能力的重要依托。只有全面依法治国才能有效保障国家治理体系的系统性、规范性、协调性，才能最大限度凝聚社会共识。在统筹推进伟大斗争、伟大工程、伟大事业、伟大梦想的实践中，在全面建设社会主义现代化国家新征程上，我们要更加重视法治、厉行法治，更好发挥法治固根本、稳预期、利长远的重要作用，坚持依法应对重大挑战、抵御重大风险、克服重大阻力、解决重大矛盾。\r\n要坚持全面推进科学立法、严格执法、公正司法、全民守法。要继续推进法治领域改革，解决好立法、执法、司法、守法等领域的突出矛盾和问题。公平正义是司法的灵魂和生命。要深化司法责任制综合配套改革，加强司法制约监督，健全社会公平正义法治保障制度，努力让人民群众在每一个司法案件中感受到公平正义。要加快构建规范高效的制约监督体系。要推动扫黑除恶常态化，坚决打击黑恶势力及其“保护伞”，让城乡更安宁、群众更安乐。\r\n推进全面依法治国是国家治理的一场深刻变革，必须以科学理论为指导，加强理论思维，不断从理论和实践的结合上取得新成果，总结好、运用好党关于新时代加强法治建设的思想理论成果，更好指导全面依法治国各项工作。\r\n李克强在主持会议时指出，习近平总书记的重要讲话全面总结了党的十八大以来法治建设取得的成就，深刻阐明了深入推进新时代全面依法治国的重大意义，系统阐述了新时代中国特色社会主义法治思想，科学回答了中国特色社会主义法治建设一系列重大理论和实践问题，对当前和今后一个时期全面依法治国工作作出了战略部署，具有很强的政治性、思想性、理论性，是指导新时代全面依法治国的纲领性文献。要认真学习领会和贯彻落实。要增强“四个意识”、坚定“四个自信”、做到“两个维护”，把会议精神转化为做好全面依法治国各项工作的强大动力，转化为推进法治建设的思路举措，转化为全面建设社会主义法治国家的生动实践，不断开创法治中国建设新局面。\r\n从对党的十八届四中全会的研究来看，全面依法治国是中国特色社会主义发展的必要前提，也是实现中华民族伟大复兴的基石。治国理政离不开依法治国，全面依法治国必须从我国国情出发，坚持中国特色社会主义法治之路。坚持对人民负责，让人民群众感受到法律的威严就在身边。坚持党的领导，只有共产党才能救中国，只有坚持共产党的领导才能发展中国。', '2023-06-19', NULL, '默认分类', '毛概', 1, NULL);
INSERT INTO `t_article` VALUES (18, '插入图片', '插入图片![alt](https://ts1.cn.mm.bing.net/th/id/R-C.88cd3d79e89d2babdc339473213e0c38?rik=TwJtFdXZpTKDYQ&riu=http%3a%2f%2fi5.qhimg.com%2ft014ee42bfafea476da.jpg&ehk=f4DQqLDSLNllmv%2bfA3XFso76FLqIs1zkw3zuDQt%2b6CI%3d&risl=&pid=ImgRaw&r=0)', '2023-06-19', NULL, '默认分类', '', 1, NULL);
INSERT INTO `t_article` VALUES (19, '第五章作业', '第五章\r\n5-12不行。重传时，IP数据报的标识字段会有另一个标识符。仅当标识符相同时IP数据报片才能组装成一个IP数据报。前两个IP数据报片的标识符与后两个IP数据报片的标识符不同，因此不能组装成一个IP数据报。\r\n5-13UDP用户数据报的长度=8192+8=8200 B\r\n以太网数据字段最大长度是1500 B。若IP首部为20 B，则IP数据报的数据部分最多只能有1480 B。8200=1480×5+800，因此划分的数据报片共6个。\r\n数据字段的长度：前5个是1480字节，最后一个是800字节。\r\n第1个数据报片的片偏移字节是0。\r\n第2个数据报片的片偏移字节是1480B。\r\n第3个数据报片的片偏移字节是1480×2=2960B。\r\n第4个数据报片的片偏移字节是1480×3=4440B。\r\n第5个数据报片的片偏移字节是1480×4=5920B。\r\n第6个数据报片的片偏移字节是1480×5=7400 B。\r\n把以上得出的片偏移字节数除以8，就得出片偏移字段中应当写入的数值。因此片偏移字\r\n段的值分别是：0，185，370，555，740和925(字节数除以8)。\r\n\r\n5-23(1)第一个报文段的数据序号是70到99，共30字节的数据。\r\n(2)B期望收到下一个报文段的第一个数据字节的序号是100，因此确认号应为100。\r\n(3)A发送的第二个报文段中的数据的字节数是180-100=80字节。\r\n(4)B在第二个报文段到达后向A发送确认，其确认号应为70。\r\n\r\n5-45我们假定A和B之间建立了TCP连接，并且已经交换了一些数据。\r\n现在A应当发送的数据都已经发送完毕了。如果A现在突然把TCP连接释放掉，那么有可能出现这种情况：A发送给B的某些报文段正在网络中传送，但因某种原因，报文段丢失了。A以为B应当收到A所发送的全部报文段，但事实上，有些报文段B没有收到。这就是题目所说的“可能会丢失用户数据”。\r\n我们再假定：A已经收到了来自B的确认，B向A确认已经收到了A所发送的全部数据。如果A现在突然把TCP连接释放掉，那么A发送给B的数据是不可能丢失了，因为B已经确认收到了A所发送的全部数据。现在可能会丢失的是B要向A发送的一些数据(如果B还有这样的数据)，因为TCP连接已经突然释放了。\r\n因此，必须使用TCP的连接释放，这样就可保证不丢失数据。\r\n\r\n\r\n\r\n5-46在上一个TCP连接中，A向B发送的连接请求SYN报文段滞留在网络中的某处。于是A超时重传，与B建立了TCP连接，交换了数据，最后也释放了TCP连接。\r\n但滞留在网络中某处的陈旧的SYN报文段，现在突然传送到B了。如果不使用三报文握手，那么B就以为A现在请求建立TCP连接，于是就分配资源，等待A传送数据。但A并没有想要建立TCP连接，也不会向B传送数据。B就白白等待着A发送数据。\r\n如果使用三报文握手，那么B在收到A发送的陈旧的SYN报文段后，就向A发送SYN报文段，选择自己的序号seq=y，并确认收到A的SYN报文段，其确认号ack=x+1。当A收到B的SYN报文段时，从确认号就可得知不应当理睬这个SYN报文段(因为A现在并没有发送seq=x的SYN报文段)。这时，A发送复位报文段。在这个报文段中，RST=1，ACK=1，其确认号ack=y+1。我们注意到，虽然A拒绝了TCP连接的建立(发送了复位报文段)，但对B发送的SYN报文段还是确认收到了。\r\nB收到A的RST报文段后，就知道不能建立TCP连接，不会等待A发送数据了。', '2023-06-19', NULL, '默认分类', '计算机网络', 1, NULL);
INSERT INTO `t_article` VALUES (20, '第四章作业', '第四章作业\r\n4-09.\r\nIP数据报对传输的数据不做检验，这样做的最大好处是可以减少IP数据报的处理复杂度，提高数据报的处理速度。坏处是，这样做实际上把检验的任务交给了上层协议（如传输层）,增加了上层协议的复杂性。\r\n\r\n4-16.\r\n（1）考虑到 IP 地址和 Mac 地址均有可能是变化的（更换网卡，或动态主机配置）10－20 分钟更换一块网卡是合理的。超时时间太短会使 ARP 请求和响应分组的通信量 太频繁。而超时时间太长会使更换网卡后的主机迟迟无法和网络上的其他主机通信。\r\n（2）在源主机的ARP高速缓存中已经有了该目的IP地址的项目；源主机发送的是广播分组；源主机和目的主机使用点对点链路。\r\n\r\n4-26.\r\nLAN1:192.77.33.0/26\r\nLAN2:192.77.33.192/28\r\nLAN3:192.77.33.64/27\r\nLAN4:192.77.33.208/28\r\nLAN5:192.77.33.224/29\r\nLAN6:192.77.33.128/27\r\nLAN7:192.77.33.192/27\r\nLAN8:192.77.33.224/27\r\n\r\n4-27.\r\n是否和地址块相匹配就是是否属于这个地址块,属于这个地址块的话,那么他的网络前缀一定和86.32/12相同。那么我们比较网络前缀就可以了。\r\n86都相同,前12位为网络位,那么32为:0010\r\n\r\n4-28.\r\n这里前缀有4位和六位,题目中的地址第一个数为2,所以无论前缀是4还是6,都应该全为0,所以(1)符合要求\r\n\r\n4-29.\r\n这题首先需要先找这两个地址的相同的网络前缀为152.所以只有(4)符合要求。\r\n\r\n4-30.\r\n（1）/2；（2）/4；（3）/11；（4）/30\r\n\r\n4-31.\r\n因为CIDR没有A类、B类、C类的地址划分概念，IP地址由网络前缀的主机号组成，/20表示网络前缀有20位，剩下的就是主机号。\r\n140.120.84.24/20转换为二进制是：10001100.01111000.01010100.00000000。黑体部分为网络前缀，所以只有主机号可以变。\r\n最小地址为：140.120.80.0/20\r\n最大地址为：140.120.95.255/20\r\n地址掩码为：11111111.11111111.11110000.00000000(这里就是网络位变为1，主机位为0)\r\n一共有2 1 2 2^122 \r\n1\r\n 2=4096个地址。相当于16个C类。\r\n4-32.\r\n190.87.140.202/26转换为二进制为：10111110.01010111.10001100.11001010。黑体部分为网络前缀，所以只有主机号可以变。\r\n最小地址为：190.87.140.200/29\r\n最大地址为：190.87.140.207/29\r\n地址掩码为：11111111.11111111.11111111.11111000\r\n一共有2 3 2^32 \r\n3\r\n =8个地址。相当于1/32个C类地址。\r\n\r\n4-33.\r\n(1)每个子网前缀需要28位，才能平均划分为4个一样大的子网。\r\n(2)每个子网的地址中有4位留给主机用，因此共有16个地址。\r\n(3)四个子网的地址块是：\r\n(4)每一个子网可分配的最小地址和最大地址为：\r\n第一个地址块136.23.12.64/28，可分配给主机使用的\r\n最小地址：136.23.12.01000001＝136.23.12.65/28\r\n最大地址：136.23.12.01001110＝136.23.12.78/28\r\n第二个地址块136.23.12.80/28，可分配给主机使用的\r\n最小地址：136.23.12.01010001＝136.23.12.81/28\r\n最大地址：136.23.12.01011110＝136.23.12.94/28\r\n第三个地址块136.23.12.96/28，可分配给主机使用的\r\n最小地址：136.23.12.01100001＝136.23.12.97/28\r\n最大地址：136.23.12.01101110＝136.23.12.110/28\r\n第四个地址块136.23.12.112/28，可分配给主机使用的\r\n最小地址：136.23.12.01110001＝136.23.12.113/28\r\n最大地址：136.23.12.01111110＝136.23.12.126/28\r\n\r\n4-54.\r\n从概念上讲没有改变,作用还是将IP地址翻译为以太网的MAC地址，但因IPv6地址长度增大了,所以相应的字段都需要增大。\r\n\r\n4-55.\r\n分片与重装是非常耗时的操作.IPV6采用端到端分片法，端到端分片将把这一功能从路由器中删除,并移到网络边缘的主机中,就可以减少路由开销使得路由器可以在单位时间内处理更多的数据报。也就是大大的加快网络中IP数据的转发速度\r\n\r\n4-56.\r\nIPv6的地址重建共有2 128 2^{128}2 128个地址,或3.4×1 0 38 10^{38}10 38次方。1秒种分配1 0 18 10^{18}10 18个地址,可分配1.08×1 0 13 10^{13}10 13年。\r\n\r\n4-57.\r\n(1) ::F53:6382:AB00:67DB:BB27:7332\r\n(2)::4D:ABCD\r\n(3)::AF36:7328:0:87AA:398\r\n(4)2819:AF::35:CB2:B271', '2023-06-19', NULL, '默认分类', '计算机网络', 1, NULL);
INSERT INTO `t_article` VALUES (21, '第三章作业', '3-04.\r\n⑴封装成帧就是在一段数据前后分别添加首部和尾部。接收端以便从收到的比特流中识别帧的开始与结束，帧定界是分组交换的必然要求；\r\n⑵ 透明传输避免消息符号与帧定界符号相混淆；\r\n⑶差错检测防止差错的无效数据帧，浪费网络资源。', '2023-06-19', NULL, '默认分类', '计算机网络', 1, NULL);
INSERT INTO `t_article` VALUES (22, '第二章作业', '第二章作业\r\n4.数据：是运送信息的实体。\r\n\r\n​ 信号：是数据的电气的或电磁的表现。\r\n\r\n​ 模拟数据：即连续数据，即数据的变化是连续的。\r\n\r\n​ 模拟信号：即连续信号，其特点是代表信息的参数的取值是连续的。\r\n\r\n​ 基带信号：即来自信源的信号，也就是基本频带信号。\r\n\r\n​ 带通信号：把基带信号的频率范围搬移到较高的频段以便在信道中传输。经过载波调制后的信号称为带通信号。这种信号仅在一段频率范围内（即频带）能够通过信道。\r\n\r\n​ 数字数据：即离散数据，即数据的变化是不连续的（离散的）。\r\n\r\n​ 数字信号：即离散信号，其特点是代表信息的参数的取值是离散的。\r\n\r\n​ 码元：码是信号元素和字符之间的事先约定好的转换。码元实际上就是码所包含的元素。在采用最简单的二进制编码时，一个码元就是一个比特。但在比较复杂的编码中，一个码元可以包含多个比特。\r\n\r\n​ 单工通信：又称为单向通信，即只能由一个方向的通信而没有反方向的交互。\r\n\r\n​ 半双工通信：又称为双向交替通信，即通信的双方都可以发送信息，但不能双方同时发送（当然也就不能同时接收）。这种通信方式时一方发送另一方接收，过一段时间后再反过来。\r\n\r\n​ 全双工通信：又称为双向同时通信，即通信的双方可以同时发送和接收信息。\r\n\r\n​ 串行传输：数据在传输时是逐个比特按照时间顺序依次传输的。\r\n\r\n​ 并行传输：数据在传输时采用了n个并行的信道。在每一个信道上，数据仍然是串行传输的，即逐个比特按照时间顺序依次传输。但把这n个信道一起观察时，就可看出，数据的传输是n个比特。\r\n\r\n7.C=R*Log2（16）=20000b/s*4=80000b/s\r\n\r\n18.靠先进的DMT编码，频分多载波并行传输、使得每秒传送一个码元就相当于每秒传送多个比特\r\n\r\n19.EPON(Ethernet Passive OpticalNetwork 以太网无源光网络)是一种采用点到多点网络结构、无源光纤传输方式、基于高速以太网平台和TDM(时分复用 )时分MAC媒体访问控制方式、提供多种综合业务的宽带接入技术\r\nGPON(Gigabit-CapablePON千兆比无源光网络) 技术是基于ITU-TG.984.x（国际电联TG.984.x）标准的最新一代宽带无源光综合接入标准，具有高带宽，高效率，大覆盖范围，用户接口丰富等众多优点，被大多数运营商视为实现接入网业务宽带化，综合化改造的理想技术。\r\n', '2023-06-19', NULL, '默认分类', '计算机网络', 1, NULL);
INSERT INTO `t_article` VALUES (23, '第一章作业', '第一章作业\r\n1-03.\r\n电路交换：\r\n优点：1.信息传输时延小2.信息以数字信号的形式在数据信道上进行“透明”传输，交换机对用户的数据信息不存储、处理，交换机在处理方面的开销比较小，对用户的数据信息不用附加控制信息，使信息的传送效率较高3.信息的编译吗和代码格式由通信双方决定，与交换网络无关。\r\n缺点:1.网络的利用率低2.线路的利用率低3.限不同速率、不同代码格式、不同控制方式的相互直通4.无呼损。\r\n报文交换：\r\n优点：1.不同的终端接口之间可以相互直通2.无呼损3.利用动态的复用技术，线路的利用率较高。\r\n缺点：传输时延大，而且变化的范围比较大2.利用“存储-转发”，所以要求交换系统有较高的处理速度和大的存储能力3.实时性较差。\r\n分组交换：\r\n优点：1.可以对不同的接口终端进行匹配2.网络轻载情况下，传输时延较小，且比较稳定3.线路利用率高4.可靠性高5.经济效益好\r\n缺点：1.网络系统附加了大量的控制信息，对于报文较长的信息传输率低2.技术实现复杂。\r\n\r\n1-10.\r\n电路交换：发送时延：x/b传播时延：k*d电路建立时间：s总时间：k*d+x/b+s分组交换：分组次数：x/p发送时延：p/b传送时延：k*d存储转发有延迟，最多为k-1次总时间：(x/p)*(p/d)+k*d+(k-1)*(p/b)故：当s>(k-1)*(p/b)时，分组交换的时延比电路交换的要小\r\n\r\n1-15\r\n根据公式D=D0/(1-U)=D0/(1-90%)=10D0;是最小值的10倍\r\n\r\n1-17\r\n发送时延 = 数据长度（比特）/发送速率（比特/每秒）\r\n              = 107/100000 = 107  / 105=100s；\r\n     传播时延 = 信道长度（米）/信号在信道上的传播速\r\n                率（米/每秒）= 106/(2×108)=0.005s；\r\n发送时延 = 数据长度（比特）/发送速率（比特/每秒）   \r\n              = 103/1000 000 000 =103 / 109=1μs；\r\n     传播时延 = 信道长度（米）/信号在信道上的传播速\r\n                率（米/每秒）\r\n= 106/(2×108)=0.005s\r\n从上面计算结果可知：\r\n发送时延仅与发送的数据量、发送速率有关，与传播速率无关；\r\n传播时延仅与传播速度与传播距离有关，与发送速率无关。\r\n\r\n1-18\r\n(1）1兆： 0.1 /(2.3  × 10^8) * 10^6 = 4.35 * 10^-4 \r\n         10g :   0.1/(2.3 × 10 ^8 ) *10^10 =4.35  \r\n(2)  1m:      按倍数关系可知：4.35 *10^-1 =0.435 \r\n     10g:     4.35 *10 ^3 \r\n(3)1m:435 \r\n10g:4.35 *10 6 \r\n(4) \r\n1m: 21750 bit \r\n10g: 2.175 *10^8\r\n\r\n1-19\r\n数据长度为100字节时 \r\n传输效率=100/（100+20+20+18）=63.3% \r\n数据长度为1000字节时， \r\n传输效率=1000/（1000+20+20+18）=94.5% \r\n\r\n1-21\r\n1、协议是控制对等实体之间通信的规则，是水平的。服务是下层通过层间接口向上层提供的功能，是垂直的。 \r\n2、协议的实现保证了能够向上一层提供服务，要实现本层协议还需使用下层提供的服务\r\n\r\n1-22\r\n网络协议:为进行网络中的数据交换而建立的规则、标准或约定。\r\n由以下三个要素组成:\r\n(1)语法:即数据与控制信息的结构或格式。\r\n(2)语义:即需要发出何种控制信息，完成何种动作以及做出何种响应。\r\n(3)同步:即事件实现顺序的详细说明。\r\n\r\n1-24\r\n综合OSI和TCP/IP的优点，采用一种原理本系结构。各层的主要功能:物理层物理层的任务就是透明地传送比特流。(注意:传递信息的物理媒体，如双绞线、同轴电缆，光缆等，是在物理层的下面，当做第0层。)物理层还要 确定连接电缆插头的定义及连接法。数据链路层数据链路层的任务是在两个相邻结点间的线路上无差错地传送以帧( frame)为单位的数据。每一帧包括数据和必要的控制信息。网络层网络层的任务就是要选择合适的路由，使发送站的运输层所传下来的分组能够正确无误地按照地址找到目的站，并交付给目的站的运输层，运输层运输层的任务是向上一层的进行通信的两个进程之间提供“个可靠的端到端服务， 使它们看不见运输层以下的数据通信的细节。应用层应用层直接为用户的应用进程提供服务。', '2023-06-19', NULL, '默认分类', '计算机网络', 1, NULL);

-- ----------------------------
-- Table structure for t_authority
-- ----------------------------
DROP TABLE IF EXISTS `t_authority`;
CREATE TABLE `t_authority`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `authority` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '权限',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_authority
-- ----------------------------
INSERT INTO `t_authority` VALUES (1, 'ROLE_admin');
INSERT INTO `t_authority` VALUES (2, 'ROLE_common');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `article_id` int(0) NOT NULL COMMENT '关联的文章id',
  `created` date NOT NULL COMMENT '评论时间',
  `ip` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '评论用户登录的ip地址',
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '评论内容',
  `status` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'approved' COMMENT '评论状态',
  `author` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '评论用户用户名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (16, 23, '2023-06-19', '0:0:0:0:0:0:0:1', '做得很好，我很喜欢，我是4612210111', 'approved', 'lilpbuc');
INSERT INTO `t_comment` VALUES (17, 22, '2023-06-19', '0:0:0:0:0:0:0:1', '第二章也很好', 'approved', 'lilpbuc');
INSERT INTO `t_comment` VALUES (18, 21, '2023-06-19', '0:0:0:0:0:0:0:1', '第三章也不错，我要copy一下\r\n', 'approved', 'lilpbuc');
INSERT INTO `t_comment` VALUES (19, 23, '2023-06-19', '0:0:0:0:0:0:0:1', '123456789', 'approved', 'admin');
INSERT INTO `t_comment` VALUES (20, 23, '2023-06-20', '0:0:0:0:0:0:0:1', '12345', 'approved', 'admin');

-- ----------------------------
-- Table structure for t_statistic
-- ----------------------------
DROP TABLE IF EXISTS `t_statistic`;
CREATE TABLE `t_statistic`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `article_id` int(0) NOT NULL COMMENT '关联的文章id',
  `hits` int(0) NOT NULL DEFAULT 0 COMMENT '文章点击总量',
  `comments_num` int(0) NOT NULL DEFAULT 0 COMMENT '文章评论总量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_statistic
-- ----------------------------
INSERT INTO `t_statistic` VALUES (14, 14, 2, 0);
INSERT INTO `t_statistic` VALUES (15, 15, 0, 0);
INSERT INTO `t_statistic` VALUES (16, 16, 3, 0);
INSERT INTO `t_statistic` VALUES (18, 18, 2, 0);
INSERT INTO `t_statistic` VALUES (19, 19, 0, 0);
INSERT INTO `t_statistic` VALUES (20, 20, 1, 0);
INSERT INTO `t_statistic` VALUES (21, 21, 3, 1);
INSERT INTO `t_statistic` VALUES (22, 22, 7, 1);
INSERT INTO `t_statistic` VALUES (23, 23, 16, 3);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `password` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `created` date NULL DEFAULT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', '$2a$10$5ooQI8dir8jv0/gCa1Six.GpzAdIPf6pMqdminZ/3ijYzivCyPlfK', '1785022137@qq.com', '2023-05-01', 1);
INSERT INTO `t_user` VALUES (3, 'lilpbuc', '$2a$10$5ooQI8dir8jv0/gCa1Six.GpzAdIPf6pMqdminZ/3ijYzivCyPlfK', '1785022137@qq.com', '2023-05-01', 1);

-- ----------------------------
-- Table structure for t_user_authority
-- ----------------------------
DROP TABLE IF EXISTS `t_user_authority`;
CREATE TABLE `t_user_authority`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL COMMENT '关联的用户id',
  `authority_id` int(0) NOT NULL COMMENT '关联的权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_authority
-- ----------------------------
INSERT INTO `t_user_authority` VALUES (1, 1, 1);
INSERT INTO `t_user_authority` VALUES (2, 2, 2);
INSERT INTO `t_user_authority` VALUES (3, 3, 2);
INSERT INTO `t_user_authority` VALUES (4, 4, 2);

SET FOREIGN_KEY_CHECKS = 1;
