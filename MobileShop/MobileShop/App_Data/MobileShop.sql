USE [MobileShop]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 5/9/2017 3:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/9/2017 3:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/9/2017 3:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/9/2017 3:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/9/2017 3:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/9/2017 3:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 5/9/2017 3:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[ProductID] [int] NULL,
	[Value] [nvarchar](255) NULL,
	[Date] [datetime] NULL CONSTRAINT [DF_Comment_Date]  DEFAULT (getdate()),
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetailedInvoice]    Script Date: 5/9/2017 3:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailedInvoice](
	[DetailedInvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NULL,
	[ProductID] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_DetailedInvoice] PRIMARY KEY CLUSTERED 
(
	[DetailedInvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Disscount]    Script Date: 5/9/2017 3:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disscount](
	[DiscountID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Value] [int] NULL,
 CONSTRAINT [PK_Disscount] PRIMARY KEY CLUSTERED 
(
	[DiscountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Image]    Script Date: 5/9/2017 3:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ImageURL] [text] NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 5/9/2017 3:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[StatusID] [int] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producer]    Script Date: 5/9/2017 3:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[ProducerID] [int] IDENTITY(1,1) NOT NULL,
	[ProducerName] [nvarchar](255) NULL,
	[LoGo] [nvarchar](255) NULL,
	[Deleted] [bigint] NULL CONSTRAINT [DF_Producer_Deleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[ProducerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/9/2017 3:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NULL,
	[ProductTypeID] [int] NULL,
	[ProducerID] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[Sold] [int] NULL,
	[Quantity] [int] NULL,
	[Viewed] [int] NULL,
	[Date] [date] NULL,
	[Description] [nvarchar](255) NULL,
	[ImageURL] [nvarchar](255) NULL,
	[Deleted] [bigint] NULL CONSTRAINT [DF_Product_Deleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 5/9/2017 3:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[ProductDetailedID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Screen] [nvarchar](50) NULL,
	[OperatingSystem] [nvarchar](50) NULL,
	[CPU] [nvarchar](50) NULL,
	[Ram] [nvarchar](50) NULL,
	[Pin] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductDetail] PRIMARY KEY CLUSTERED 
(
	[ProductDetailedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 5/9/2017 3:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ProductTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeName] [nvarchar](255) NULL,
	[Deleted] [bigint] NULL CONSTRAINT [DF_ProductType_Deleted]  DEFAULT ((0)),
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ProductTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 5/9/2017 3:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 5/9/2017 3:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [nvarchar](128) NOT NULL,
	[UserTypeID] [int] NULL,
	[Username] [nvarchar](20) NULL,
	[Password] [nvarchar](20) NULL,
	[Name] [nvarchar](100) NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [nchar](11) NULL,
	[Birthday] [nvarchar](30) NULL,
	[Deleted] [bigint] NULL CONSTRAINT [DF_User_Deleted]  DEFAULT ((0)),
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserType]    Script Date: 5/9/2017 3:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[UserTypeID] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201705041435263_InitialCreate', N'MobileShop.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5D596FE4B8117E0F90FF20E82909BCDD3E760613A3BD0B6F7BBC6BC457DCF6206F03B6C46E0BA3A357A23C3682FCB23CE427E52F84D4C9532225B5BA1DCC8B9BC757C562912C96AA38FFFDF77F663FBF06BEF502E3C48BC233FB6872685B307422D70BD767768A563F7CB27FFEE98F7F987D768357EB4BD9EE84B4C33DC3E4CC7E4668733A9D26CE330C4032093C278E926885264E144C811B4D8F0F0FFF3A3D3A9A420C61632CCB9A3DA421F20298FDC03FE751E8C00D4A817F13B9D04F8A725CB3C850AD5B10C064031C7866DF444BCF878BE76833C91BDBD6B9EF01CCC802FA2BDB0261182180309BA74F095CA0380AD78B0D2E00FEE3DB06E2762BE027B060FFB46EAE3B92C363329269DDB18472D204458121E0D149219A29DFBD9380ED4A7458789FB190D11B197526C033FB2A006B3C729ED2E9DC8F492B5AB8784A42E890DA49D6EBC0AAEB0E2A45C0FA42FE1D58F3D447690CCF4298A218F807D67DBAF43DE76FF0ED31FA06C3B330F57D9A37CC1DAE630A70D17D1C6D608CDE1EE08AE6F8EAC2B6A66CE729DFBBEACB77CC077615A29363DBBAC56C80A50F2B25A084B040510C7F85218C0182EE3D4008C6780EAF5C988951608123887FBAA983DA4936C3647C3F3D5C97285881F152B4AD1BF07A0DC3357AC693045E6DEBD27B856E5952203F851E5EB9B8138A538ED06C5A2B43A38AE4C380B1B196941D77A42825F92EBA42F71D575D604C7E0D3CD722B1EBE8D768EB442EA00FB12428117EFCB19712A28E3A8876AA82A8BB066A6C1E83EF57A3E85F418B501186A8B74C8CBB794E35AC0BE87801F06DEB3EC67F1586CE27DB5A388048B6156C11F9AE11F5BFA7A09802834E5F3CF81D9AD1B9C0135F0D12FFFDE8051AAB3471626F931B185B9EF62D9D655BDD7ACAE5F310F9CD965265859D279B5B882665C7490E791963B8EF51FC6D4223E29D49B75FBD711DEB6E5C2747CBD5C9A70F1F817BF2F14778F2A193C1E576B0B5DC86193E3AFEA435C3867652CBBE75FCE1E320546FC18BB7CEA69EA38FEF1631BE7A3C403FAB4D9EBD4D7E0361E6FB6BD1EC328E02F29BD5AFBCF6EB224AE36CB78A944D1E41BC86A8A74A13A8E1D5BA44DD7FD5269C8AEA2D6D4A06D465259424C65E0D25BFDBA5ABAD71E79B0D9EBC4CB58844F4ECB8E23A3FE13AEFEAE2F94EF6C1CF01F0FC0136420D2AD8D05E7971509FB3BF4458ED4068CCF33D4812BC0FB8BF81E479EBB6C1023A698CD5738140B0D9BEA5FB1C85F0360D9644EBC7A335D8D43C7E8F2E81836F169F43D2AB37DE75E47C8B52F439748981FA841C537BB50218849D73C7814972899519BAF3280D513F670DD99F766D88CC7DE005724B84DB49BF964D6B6B44DE42B04814CD64564913ABD7D1DA0BF5582D9BAA59CD5BB4B25A3433659580E9715AB454339A3568E5336F35989D97CDD0F0865E06BBFF965EBFC37BFBBE975D9989D9F411A25B3F9B324A5F809F0E4DAAD36AC83681E1574306BBFFAB21631317BF782EB14A34AE3F65630CAFD55E7EB36A5F731C67632F07669863131F670F502D97F324891C2F5B0512C757E1B660F9C7369CD5EEC3C847C3FB41F0C0B0A27BE4C8C325786C36AF547761EEC4B3CE9DFCDBE91C240E704531E201B9068C9527AA84B1DA1FC232F7178126D67418934E805C8212BC52BD1089CBC20B1D6F03FC5629713D358F3032F68A065F7301373024045B25A1435CEEFE200C5474B8496993D06C4A695CB3222AAC56D59CB799B0F5BC0B5E895174B2C57656E86561BF6D45319B25368272368B448701A52B6F170A5ADC55741580BFB8EC9B8272372685821626D5280ACA4A6C070ACA8AE4DD29687E45D59D7FEEBEBA6FEAC95E94C73FD61BC5B503DD64E4B167AA99DB9EB80FC23D602CAAE7C59254C25759A807E6B3B89F2585A9CBAB08015F40447F6D4E6CAB36784BC5C8A3DEA6CDDDCB480319421D14A50582D418A20B8A8728FC49E2281873BA05845F0B4D80F57A69012DBE650A40C2BE60C05CE9926CE4AE30860C604BF761236C718471B0942A8BD8F4375DAAA1FACB2FBFC6B42E51D5C82A6D10D6AAD69D87C2912804BF07B303D7108ACABD2C0A46C7A43731EAA9811593D120A016035C21A47230834BA954CD7629C9EC4A13CBB29794382B5021A57230834BA9D0D17621496C1B03EBA69788584B64A0C5563A6CAA43B3AA9B4DF360F8A260365544CDCF6EC066E3856B2A8ABE28B1167908FDFC878579707990634C9D4412635E715B5142518C4F5DAE1693C69C5E7A71822E00024B40DC557337109A494D04C5F65F9264AC007116CB83A06C4EFECEBB882108B9C5201A5345DF4B3CB4805864D967007AE2E5FD2C92C7007C10AB62D4E7919F066163C47B130E153D4A2329E3515B79CA62F604A6B252116936E5C422D89582F005EB9F9D4AAD89AEEDB57E735DD976E6D3ADEEDA3C537938AB3855B2E8751DB4FC13B40C2FAFD147CC03C569A4BC441FA10AC5A441AAC23DD31E348CF2C8EE5D7ABA23E939C6226762BF2568A66AC3C5774B10CB2A73E51E6AA96401E12C5056A48F91C781D31079893E421D184EA3D4A5FA4865B4388D5396192CD62C809C59A95989C972A7C2C9D9254F556CF3F879E71B91CA7E35325768D74007ABA5B1BB72A638D1CA5C4AEADEE2D6A3DA7376342FA20D3FCC1C55DE96EEF3A4865049BB74F9D1F256B901D528E557411A45F5A57067F3A672BB98CC15EFD0329FAA5684EDACAA22189806288A0C31A87852018CAA33387F99905FE618666A0C4E6336AE973996D92A032EE9E85D8649BAA2139E42A2F216FA14C4785D1A5DAC35B90A0891BBECBD40A8EE802DE199AFD3479504F7D2C0926A7DEC3AD297DF43F7F8DC52BA59BB1E5CB923BEDFC9A5C0D8CE8638CCC147854DD24054B121561118298015E57BA94C4A6F745765CA3FBFF4532605867ADF61E20DD96DA73148528DC904117217557510A51ACF4C65B7AA18822F9A6F5251AF7CD29CEF7956F881DB9F75111CC3791392B49D8B111FEB6F0982C18434982C7EF7E7BE07C9265E36B801A1B78209CA0367EDE3C3A363EE6998FD79A6659A24AE2FF1A30B6FB5B09335EA93291E116E6BA0BB79C82DFBD04146A5E71B29E10B889D6710FF2900AF7FA6D1867807A5C30CA85D545DDE22D9E23CB0D94B06621401E927467A0171B9FC4B6FCDA948EF49E5BF248DFEB8C73657D66013CA396EA5AB551F4750685310EA3D0FB7F53D0F3370FA7D8F0EBCF1AF7D748060DFFEE80040BF04E2E2BF51965969BAF08497417A29508F5D7ADC5D41EDFF1C23DBAC148B98FBD1E3458C1A5408ABBB0A5DF87A66FF33EB759A853690BFB2E203EB2A790ABDDF535CF188056AFD4BCC651DE68580665FE69EBEE7A02FD5AB7F7CCDBB1E587731B64D4FAD434E965D66987DE5C1889BBC6B0F6E3ABFFDF07E1714F3B48214955B10DD5F52587AE656B0EC15855E7BACF4A5847E3684F81AC25078838850F5DA41172CE54B075DCF63F9CB075D5853BE7AD0E5F2C5BF79A0BF0D953D7778D4489C8F636C495B31F8F7EB6C1252CB7B2D74317D7C1B77FC164FE2FF6576F560A7E3BD983C3D18F62E557BEB19D3FB92245DE77DEC36377ACC74E886E80BDD4B83F51EB2A0F7206F4F92C0B3FB5CE7B1754DF5C1D4E032BBFF19CD7BA66C455AD7EEF396C75636D507D53D5736A3ECE43DD3B55D9D9F3BD634ED2374E7B9C662BE113FAD5C12699E2B5C9B806C0E71FE511ADFE997E463576E439679C79AF9C58DE9C532FCFB2AD14533FBB829F9584D00B5E3B3C6AA2823A65A46297F1F4B9E12A72256AF2425C1BA899AA83A178F272CEC2A025DA1453359B3B116D650E3608B36CD641519AC4DB48BC3B19176D1A699B6222F7417B9D5D2CC4C59BE7BCB26DF1488FD9E72A99991B4A4EEB719F48D217EEF29757A10A130AB4711AAF67E32A50711C9904BC720335A8C3AC38605F55F8E61E326F1D635C4ACFE3F646AD0B2CD55B88A4ACB86E3A86CC2B9AF6E20022EB637CE63E4AD8083703571C0670FFC654E4DF2196809DDABF02E459B14E121C360E933DE40622135D1CFD2BF599E6777D9C7FB64882160363DF2E1E22EFC25F5487844C1F7A5C461A68020A657E1EE26738988DB7BFD5621DD46A1265021BECA627C84C1C6C760C95DB8002FB00B6F58FDAEE11A386FB57B5405D23E11ACD867171E58C720480A8CBA3FFE8975D80D5E7FFA1FB2F1B89F796F0000, N'6.1.3-40302')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'd8286ea1-31d9-4303-9c0b-9ba593b5e173', N'Admin')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a4a971ba-067f-4844-a77a-af2a92c44858', N'd8286ea1-31d9-4303-9c0b-9ba593b5e173')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'15d99df5-7ba4-427f-bc52-a9a27708463e', N'abc@gmail.com', 0, N'ADORAMQOac8JebxjjP7VY0/vRvDoHmBDso3dkh7BHd2K1qB7ZQg5R+zqYvZSzELS2Q==', N'7f45a839-7bcd-422e-b027-9a2e6b2fcc87', NULL, 0, 0, NULL, 1, 0, N'abc@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a4a971ba-067f-4844-a77a-af2a92c44858', N'tmt@gmail.com', 0, N'AOBnDQ1Ksu5vBCKKospW6rGCgy7Bj5R/sy2RJvc3VcLdrrsEDMcf6xpSePXWb+iGHQ==', N'e8562452-e0f7-4417-9eba-f89f92029878', NULL, 0, 0, NULL, 0, 0, N'tmt@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'fbe744fa-7d45-49db-adbd-dae265ebfe32', N'Ab1@123.com', 0, N'AHjhygPRuATsyxCqQuvHWenf8eBm45vp2/64RgJgruI0bgYcnpMB+1FZXxXIDRq86w==', N'7a9a480a-d782-4648-8793-ee0167bb513f', NULL, 0, 0, NULL, 1, 0, N'Ab1@123.com')
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([CommentID], [UserID], [ProductID], [Value], [Date]) VALUES (1, N'a4a971ba-067f-4844-a77a-af2a92c44858', 2, N'test1', CAST(N'2017-05-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [UserID], [ProductID], [Value], [Date]) VALUES (2, N'a4a971ba-067f-4844-a77a-af2a92c44858', 3, N'test2', CAST(N'2017-05-08 00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [UserID], [ProductID], [Value], [Date]) VALUES (4, N'a4a971ba-067f-4844-a77a-af2a92c44858', 1, N'test', CAST(N'2017-05-08 00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [UserID], [ProductID], [Value], [Date]) VALUES (5, N'a4a971ba-067f-4844-a77a-af2a92c44858', 2, N'asdfas', CAST(N'2017-05-08 14:46:07.860' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [UserID], [ProductID], [Value], [Date]) VALUES (6, N'a4a971ba-067f-4844-a77a-af2a92c44858', 1, N'test', CAST(N'2017-05-08 14:46:25.650' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [UserID], [ProductID], [Value], [Date]) VALUES (7, N'a4a971ba-067f-4844-a77a-af2a92c44858', 1, N'abc', CAST(N'2017-05-08 17:17:04.943' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [UserID], [ProductID], [Value], [Date]) VALUES (8, N'a4a971ba-067f-4844-a77a-af2a92c44858', 2, N'abc', CAST(N'2017-05-08 17:43:04.147' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [UserID], [ProductID], [Value], [Date]) VALUES (9, N'a4a971ba-067f-4844-a77a-af2a92c44858', 2, N'abc2', CAST(N'2017-05-08 17:43:14.273' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [UserID], [ProductID], [Value], [Date]) VALUES (10, N'a4a971ba-067f-4844-a77a-af2a92c44858', 2, N'them cai nua', CAST(N'2017-05-08 17:44:30.773' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [UserID], [ProductID], [Value], [Date]) VALUES (11, N'a4a971ba-067f-4844-a77a-af2a92c44858', 2, N'them', CAST(N'2017-05-08 17:48:11.873' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [UserID], [ProductID], [Value], [Date]) VALUES (12, N'a4a971ba-067f-4844-a77a-af2a92c44858', 2, N'ahihi', CAST(N'2017-05-08 17:58:29.193' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [UserID], [ProductID], [Value], [Date]) VALUES (13, N'a4a971ba-067f-4844-a77a-af2a92c44858', 1, N'bình loạn nè', CAST(N'2017-05-08 21:45:25.103' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [UserID], [ProductID], [Value], [Date]) VALUES (14, N'fbe744fa-7d45-49db-adbd-dae265ebfe32', 2, N'test', CAST(N'2017-05-08 22:20:42.093' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [UserID], [ProductID], [Value], [Date]) VALUES (15, N'fbe744fa-7d45-49db-adbd-dae265ebfe32', 1, N'them nef', CAST(N'2017-05-08 22:20:59.747' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [UserID], [ProductID], [Value], [Date]) VALUES (16, N'fbe744fa-7d45-49db-adbd-dae265ebfe32', 2, N'test', CAST(N'2017-05-09 00:34:18.450' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [UserID], [ProductID], [Value], [Date]) VALUES (17, N'fbe744fa-7d45-49db-adbd-dae265ebfe32', 2, N'ajax', CAST(N'2017-05-09 00:38:59.827' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [UserID], [ProductID], [Value], [Date]) VALUES (18, N'fbe744fa-7d45-49db-adbd-dae265ebfe32', 1, N'ajax', CAST(N'2017-05-09 00:42:48.793' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [UserID], [ProductID], [Value], [Date]) VALUES (19, N'fbe744fa-7d45-49db-adbd-dae265ebfe32', 1, N'blea', CAST(N'2017-05-09 00:48:27.917' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [UserID], [ProductID], [Value], [Date]) VALUES (20, N'fbe744fa-7d45-49db-adbd-dae265ebfe32', 1, N'blea', CAST(N'2017-05-09 00:48:38.773' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [UserID], [ProductID], [Value], [Date]) VALUES (21, N'fbe744fa-7d45-49db-adbd-dae265ebfe32', 2, N'duoc di ma', CAST(N'2017-05-09 01:01:23.153' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [UserID], [ProductID], [Value], [Date]) VALUES (22, N'fbe744fa-7d45-49db-adbd-dae265ebfe32', 2, N'do luon ne', CAST(N'2017-05-09 01:09:02.490' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [UserID], [ProductID], [Value], [Date]) VALUES (23, N'fbe744fa-7d45-49db-adbd-dae265ebfe32', 2, N'ahihi', CAST(N'2017-05-09 01:09:07.620' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [UserID], [ProductID], [Value], [Date]) VALUES (24, N'a4a971ba-067f-4844-a77a-af2a92c44858', 1, N'thêm bình luận', CAST(N'2017-05-09 13:07:05.337' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [UserID], [ProductID], [Value], [Date]) VALUES (25, N'a4a971ba-067f-4844-a77a-af2a92c44858', 1, N'fgdfdgdf', CAST(N'2017-05-09 13:18:05.767' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [UserID], [ProductID], [Value], [Date]) VALUES (26, N'a4a971ba-067f-4844-a77a-af2a92c44858', 1, N'fgdfdgdf', CAST(N'2017-05-09 13:19:29.627' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([ImageID], [ProductID], [ImageURL]) VALUES (2, 1, N'Iphone 6 plus 16GB 1.png')
INSERT [dbo].[Image] ([ImageID], [ProductID], [ImageURL]) VALUES (3, 1, N'Iphone 6 plus 16GB 2.png')
INSERT [dbo].[Image] ([ImageID], [ProductID], [ImageURL]) VALUES (4, 1, N'Iphone 6 plus 16GB 3.png')
INSERT [dbo].[Image] ([ImageID], [ProductID], [ImageURL]) VALUES (5, 2, N'oppo-f1s-2017.png')
INSERT [dbo].[Image] ([ImageID], [ProductID], [ImageURL]) VALUES (6, 2, N'Opple F1s 64GB 2.png')
INSERT [dbo].[Image] ([ImageID], [ProductID], [ImageURL]) VALUES (7, 2, N'Opple F1s 64GB 3.png')
INSERT [dbo].[Image] ([ImageID], [ProductID], [ImageURL]) VALUES (8, 2, N'Opple F1s 64GB 1.png')
INSERT [dbo].[Image] ([ImageID], [ProductID], [ImageURL]) VALUES (9, 4, N'dell-inspiron-3567.png')
INSERT [dbo].[Image] ([ImageID], [ProductID], [ImageURL]) VALUES (10, 3, N'Dell Inspiron 3567 1.png')
INSERT [dbo].[Image] ([ImageID], [ProductID], [ImageURL]) VALUES (11, 3, N'Dell Inspiron 3567 2.png')
INSERT [dbo].[Image] ([ImageID], [ProductID], [ImageURL]) VALUES (15, 5, N'asus-zenfone-3-max-5.5.png')
INSERT [dbo].[Image] ([ImageID], [ProductID], [ImageURL]) VALUES (24, 9, N'Sony Xperia XA 1.png')
INSERT [dbo].[Image] ([ImageID], [ProductID], [ImageURL]) VALUES (26, 10, N'Iphone 6 plus 16GB 2.png')
INSERT [dbo].[Image] ([ImageID], [ProductID], [ImageURL]) VALUES (1009, 17, N'product-17-1099124801.jpeg')
INSERT [dbo].[Image] ([ImageID], [ProductID], [ImageURL]) VALUES (1018, 1016, N'product-1016-1056899959.jpg')
INSERT [dbo].[Image] ([ImageID], [ProductID], [ImageURL]) VALUES (1022, 1017, N'product-1017-1281133726.jpg')
INSERT [dbo].[Image] ([ImageID], [ProductID], [ImageURL]) VALUES (1023, 1017, N'product-1017-929761835.jpg')
INSERT [dbo].[Image] ([ImageID], [ProductID], [ImageURL]) VALUES (1024, 1017, N'product-1017-1700289763.png')
INSERT [dbo].[Image] ([ImageID], [ProductID], [ImageURL]) VALUES (1026, 1018, N'product-1018-1671575443.png')
INSERT [dbo].[Image] ([ImageID], [ProductID], [ImageURL]) VALUES (1027, 1018, N'product-1018-294619724.png')
INSERT [dbo].[Image] ([ImageID], [ProductID], [ImageURL]) VALUES (1028, 1018, N'product-1018-294619724.png')
SET IDENTITY_INSERT [dbo].[Image] OFF
SET IDENTITY_INSERT [dbo].[Producer] ON 

INSERT [dbo].[Producer] ([ProducerID], [ProducerName], [LoGo], [Deleted]) VALUES (1, N'Apple', N'logo-apple.png', 0)
INSERT [dbo].[Producer] ([ProducerID], [ProducerName], [LoGo], [Deleted]) VALUES (2, N'Sony', N'logo-sony.png', 0)
INSERT [dbo].[Producer] ([ProducerID], [ProducerName], [LoGo], [Deleted]) VALUES (3, N'Oppo', N'logo-oppo.png', 0)
INSERT [dbo].[Producer] ([ProducerID], [ProducerName], [LoGo], [Deleted]) VALUES (4, N'Intel', N'logo-intel.png', 0)
INSERT [dbo].[Producer] ([ProducerID], [ProducerName], [LoGo], [Deleted]) VALUES (5, N'Asus', N'logo-asus.png', 0)
INSERT [dbo].[Producer] ([ProducerID], [ProducerName], [LoGo], [Deleted]) VALUES (6, N'Nokia', N'logo-nokia.png', 0)
INSERT [dbo].[Producer] ([ProducerID], [ProducerName], [LoGo], [Deleted]) VALUES (7, N'BlackBerry', N'logo-blackberry.png', 0)
INSERT [dbo].[Producer] ([ProducerID], [ProducerName], [LoGo], [Deleted]) VALUES (8, N'Samsung', N'logo-samsung.png', 0)
INSERT [dbo].[Producer] ([ProducerID], [ProducerName], [LoGo], [Deleted]) VALUES (29, N'services', N'logo-services-1229482049.jpg', 0)
INSERT [dbo].[Producer] ([ProducerID], [ProducerName], [LoGo], [Deleted]) VALUES (30, N'services2', N'logo-services2-843782709.jpg', 0)
INSERT [dbo].[Producer] ([ProducerID], [ProducerName], [LoGo], [Deleted]) VALUES (31, N'services3', N'logo-services3-582090640.jpg', 0)
INSERT [dbo].[Producer] ([ProducerID], [ProducerName], [LoGo], [Deleted]) VALUES (32, N'services4', N'logo-services4-551946628.jpg', 0)
INSERT [dbo].[Producer] ([ProducerID], [ProducerName], [LoGo], [Deleted]) VALUES (33, N'test', N'logo-test-1858521770.jpg', 1)
SET IDENTITY_INSERT [dbo].[Producer] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductTypeID], [ProducerID], [Price], [Sold], [Quantity], [Viewed], [Date], [Description], [ImageURL], [Deleted]) VALUES (1, N'Iphone 6 plus 16GB', 1, 1, CAST(11990000 AS Decimal(18, 0)), 123, 5, 1234, CAST(N'2017-04-13' AS Date), N'Màn hình HD cực đẹp, trải nghiệm IOS mượt mà', N'iphone-6-plus-16gb.png', 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductTypeID], [ProducerID], [Price], [Sold], [Quantity], [Viewed], [Date], [Description], [ImageURL], [Deleted]) VALUES (2, N'Opple F1s 64GB', 1, 3, CAST(6990000 AS Decimal(18, 0)), 321, 5, 4321, CAST(N'2017-03-07' AS Date), N'Lưu trữ thoải mái, camera selfie 16MP', N'oppo-f1s-2017.png', 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductTypeID], [ProducerID], [Price], [Sold], [Quantity], [Viewed], [Date], [Description], [ImageURL], [Deleted]) VALUES (3, N'Dell Inspiron 3567', 2, 4, CAST(10590000 AS Decimal(18, 0)), 111, 5, 2345, CAST(N'2017-01-29' AS Date), N'Window 10 bản quyền, mua office giá rẻ', N'dell-inspiron-3567.png', 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductTypeID], [ProducerID], [Price], [Sold], [Quantity], [Viewed], [Date], [Description], [ImageURL], [Deleted]) VALUES (4, N'Samsung Galaxy A7', 1, 8, CAST(10990000 AS Decimal(18, 0)), 543, 5, 5432, CAST(N'2017-02-11' AS Date), N'Chống nước, bụi, cấu hình khủng', N'samsung-galaxy-a7.png', 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductTypeID], [ProducerID], [Price], [Sold], [Quantity], [Viewed], [Date], [Description], [ImageURL], [Deleted]) VALUES (5, N'Asus Zenphone 3 Max 5.5', 1, 5, CAST(4990000 AS Decimal(18, 0)), 555, 5, 2362, CAST(N'2017-02-22' AS Date), N'Cảm ứng vân tay, cấu hình mạnh mẽ', N'asus-zenfone-3-max-5.5.png', 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductTypeID], [ProducerID], [Price], [Sold], [Quantity], [Viewed], [Date], [Description], [ImageURL], [Deleted]) VALUES (6, N'Asus E402SA N3060', 2, 5, CAST(6290000 AS Decimal(18, 0)), 1345, 5, 6354, CAST(N'2017-01-30' AS Date), N'Tặng balo, trúng xe máy dễ dàng', N'asus-e402sa.png', 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductTypeID], [ProducerID], [Price], [Sold], [Quantity], [Viewed], [Date], [Description], [ImageURL], [Deleted]) VALUES (7, N'Apple Macbook 12"', 2, 1, CAST(31990000 AS Decimal(18, 0)), 645, 5, 6666, CAST(N'2017-03-02' AS Date), N'Giá rẻ online', N'apple-macbook-12.png', 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductTypeID], [ProducerID], [Price], [Sold], [Quantity], [Viewed], [Date], [Description], [ImageURL], [Deleted]) VALUES (8, N'Apple Macbook Pro Touch', 2, 1, CAST(56900000 AS Decimal(18, 0)), 342, 5, 6667, CAST(N'2017-03-23' AS Date), N'Cảm ứng vân tay', N'apple-macbook-pro-touch.png', 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductTypeID], [ProducerID], [Price], [Sold], [Quantity], [Viewed], [Date], [Description], [ImageURL], [Deleted]) VALUES (9, N'Sony Xperia XA', 1, 2, CAST(4490000 AS Decimal(18, 0)), 342, 5, 2342, CAST(N'2013-01-26' AS Date), N'Màn hình 5in, selfie dễ dàng', N'sony-xperia-xa.png', 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductTypeID], [ProducerID], [Price], [Sold], [Quantity], [Viewed], [Date], [Description], [ImageURL], [Deleted]) VALUES (10, N'Iphone 6s 128GB', 1, 1, CAST(18990000 AS Decimal(18, 0)), 1231, 5, 5657, CAST(N'2017-04-14' AS Date), N'Cơ hội trúng xe, tặng phiếu mua quà trị giá 2.5 triệu đồng', N'iphone-6s-128gb.png', 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductTypeID], [ProducerID], [Price], [Sold], [Quantity], [Viewed], [Date], [Description], [ImageURL], [Deleted]) VALUES (1018, N'Điện thoại', 1, 6, CAST(6990000 AS Decimal(18, 0)), 0, 1, 0, CAST(N'2017-04-25' AS Date), N'<p>dong1</p>

<hr />
<p>dong2</p>
', N'notfound.png', 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductDetail] ON 

INSERT [dbo].[ProductDetail] ([ProductDetailedID], [ProductID], [Screen], [OperatingSystem], [CPU], [Ram], [Pin]) VALUES (1, 1, N'5.5", Retina HD', N'IOS 9', N'Apple A8 2 nhân 64 bit', N'1GB', N'2915mAh')
INSERT [dbo].[ProductDetail] ([ProductDetailedID], [ProductID], [Screen], [OperatingSystem], [CPU], [Ram], [Pin]) VALUES (2, 2, N'5.5", HD', N'Android 5.1 (Lollipop)', N'Mediatek MT6750 8 nhân', N'4GB', N'3075mAh')
INSERT [dbo].[ProductDetail] ([ProductDetailedID], [ProductID], [Screen], [OperatingSystem], [CPU], [Ram], [Pin]) VALUES (3, 3, N'15.6", Full HD', N'Window 10 Home', N'Intel core i3, 2.0GHz', N'4GB', N'4 cell')
INSERT [dbo].[ProductDetail] ([ProductDetailedID], [ProductID], [Screen], [OperatingSystem], [CPU], [Ram], [Pin]) VALUES (4, 4, N'5.7", Full HD', N'Android 6.0 (Marshmallow)', N'Exynos 7880', N'3GB', N'3600mAh')
INSERT [dbo].[ProductDetail] ([ProductDetailedID], [ProductID], [Screen], [OperatingSystem], [CPU], [Ram], [Pin]) VALUES (5, 5, N'5.5", Full HD', N'Android 6.0', N'Qualcomm 430 8 nhân', N'3GB', N'4100mAh')
INSERT [dbo].[ProductDetail] ([ProductDetailedID], [ProductID], [Screen], [OperatingSystem], [CPU], [Ram], [Pin]) VALUES (6, 6, N'14"', N'Window 10 Home', N'Intel Celeron 1.6GHz', N'2GB', N'2 cell')
INSERT [dbo].[ProductDetail] ([ProductDetailedID], [ProductID], [Screen], [OperatingSystem], [CPU], [Ram], [Pin]) VALUES (7, 7, N'13.3"', N'Mac OS X', N'Intel core i5', N'8GB', N'10 tiếng')
INSERT [dbo].[ProductDetail] ([ProductDetailedID], [ProductID], [Screen], [OperatingSystem], [CPU], [Ram], [Pin]) VALUES (8, 8, N'Công nghệ IPS, Led 13.3"', N'Mac OS X', N'Intel Iris Graphics 550', N'8GB', N'10 tiếng')
INSERT [dbo].[ProductDetail] ([ProductDetailedID], [ProductID], [Screen], [OperatingSystem], [CPU], [Ram], [Pin]) VALUES (9, 9, N'5", HD', N'Android 6.0', N'Helio P10 8 nhân', N'2GB', N'2300mAh')
INSERT [dbo].[ProductDetail] ([ProductDetailedID], [ProductID], [Screen], [OperatingSystem], [CPU], [Ram], [Pin]) VALUES (10, 10, N'5.5", Retina HD', N'IOS 9.0', N'Apple A9 2 nhân', N'2GB', N'2350mAh')
SET IDENTITY_INSERT [dbo].[ProductDetail] OFF
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Deleted]) VALUES (1, N'Điện thoại', 0)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Deleted]) VALUES (2, N'Laptop', 0)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Deleted]) VALUES (3, N'Phụ kiện', 0)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
INSERT [dbo].[User] ([UserID], [UserTypeID], [Username], [Password], [Name], [Address], [Phone], [Birthday], [Deleted]) VALUES (N'1', 1, N'admin', N'admin', N'Tran Minh Tien', N'Bao Loc', N'1900000000 ', N'1/5/1996', 0)
INSERT [dbo].[User] ([UserID], [UserTypeID], [Username], [Password], [Name], [Address], [Phone], [Birthday], [Deleted]) VALUES (N'3', 2, N'user2', N'user2', N'Nguyen Thi B', N'HCM', N'0969696969 ', N'29/2/1996', 0)
SET IDENTITY_INSERT [dbo].[UserType] ON 

INSERT [dbo].[UserType] ([UserTypeID], [UserTypeName]) VALUES (1, N'Admin')
INSERT [dbo].[UserType] ([UserTypeID], [UserTypeName]) VALUES (2, N'Member')
SET IDENTITY_INSERT [dbo].[UserType] OFF
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_AspNetUsers]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Product]
GO
ALTER TABLE [dbo].[DetailedInvoice]  WITH CHECK ADD  CONSTRAINT [FK_DetailedInvoice_Invoice] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoice] ([InvoiceID])
GO
ALTER TABLE [dbo].[DetailedInvoice] CHECK CONSTRAINT [FK_DetailedInvoice_Invoice]
GO
ALTER TABLE [dbo].[DetailedInvoice]  WITH CHECK ADD  CONSTRAINT [FK_DetailedInvoice_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[DetailedInvoice] CHECK CONSTRAINT [FK_DetailedInvoice_Product]
GO
ALTER TABLE [dbo].[Disscount]  WITH CHECK ADD  CONSTRAINT [FK_Disscount_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Disscount] CHECK CONSTRAINT [FK_Disscount_Product]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_AspNetUsers]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Status]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Producer] FOREIGN KEY([ProducerID])
REFERENCES [dbo].[Producer] ([ProducerID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Producer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ProductTypeID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK_ProductDetail_Product]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserType] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserType] ([UserTypeID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserType]
GO
/****** Object:  StoredProcedure [dbo].[sp_Account_Login]    Script Date: 5/9/2017 3:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Account_Login]
				@username nvarchar(20),
				@password nvarchar(20)
as
begin
	declare @count int
	declare @res bit

	select @count = COUNT(*)
	from [User]
	where [Username] = @username and [Password] = @password

	if @count > 0
		set @res = 1
	else
		set @res = 0

	select @res
end

GO
/****** Object:  StoredProcedure [dbo].[usp_GetCommentByProductId]    Script Date: 5/9/2017 3:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_GetCommentByProductId] @productId INT
AS
BEGIN
	SELECT us.UserName, cmt.Value, cmt.Date
	FROM Comment cmt, AspNetUsers us
	WHERE cmt.UserID = us.Id and cmt.ProductID = @productId
	ORDER BY cmt.Date DESC
END
GO
