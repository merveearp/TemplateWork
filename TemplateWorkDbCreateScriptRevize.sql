use master
go

if DB_ID('PortfolioDb') is not NULL
BEGIN
    alter database PortfolioDb set single_user with ROLLBACK IMMEDIATE
    drop DATABASE PortfolioDb
END 
go

CREATE DATABASE PortfolioDb collate Turkish_CI_AS
go

use PortfolioDb
go 

create table AppSettings(

    Id int primary key identity,
    BrandName nvarchar(100) not null,
    HeroTitle nvarchar(300) not null,
    HeroSubtitle nvarchar(300) not null,
    HeroImageUrl nvarchar(300) not null,
    AboutText nvarchar(3000) not null,
    AboutImageUrl Nvarchar(1000) not null,
    SkillsImageUrl nvarchar(1000) not null,
    AddressText nvarchar(500) not null,
    AddressDistrict nvarchar(100) not null,
    AddressProvince nvarchar(100) not null,
    PhoneNumber nvarchar(20) not null,
    Email nvarchar(100) not null,
    GoogleMap nvarchar(max) not null,
    CreatedDate datetime2(3) not null default getdate(),
    ModifiedDate datetime2(3) 

)

go

insert into AppSettings(

BrandName,
HeroTitle,
HeroSubtitle,
HeroImageUrl,
AboutText,
AboutImageUrl,
SkillsImageUrl,
AddressText,
AddressDistrict,
AddressProvince,
PhoneNumber,
Email,
GoogleMap
)values

(
    'Merve Türk Arpacıoğlu',
    'Yazılım Geliştirici',
    'DotNet|Asp.Net Core|Html|Css|Javascript',
    'http://localhost:5500/ui/img/hero-img.png',
    '<p>Nişantaşı Üniversitesi Acundmedya Akademi bünyesinde BackEnd Yazılım Eğitimi aldım</p>
    <p>Aldığım eğitim boyunca çeşitli projeler yaparak kendimi geliştirdim.</p>',
    'http://localhost:5500/ui/img/hero-img.png',
    'http://localhost:5500/ui/img/skills.png',
    'Devasa Plaza Kat4/5',
    'Ataşehir',
    'İstanbul',
    '+90 546 669 84 55',
    'merveearp@icloud.com',
    '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3008.0562664573226!2d28.94414357556142!3d41.0677627157608!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14cab0ce099c5d49%3A0x9f665fc172ad4624!2s%C4%B0stanbul%20Bilgi%20%C3%9Cniversitesi!5e0!3m2!1str!2str!4v1730202126070!5m2!1str!2str" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>'

)
go 
create table Socials(
    Id int primary key identity,
    Name nvarchar(50) not null,
    Url nvarchar(1000)not null,
    Icon nvarchar(50) not null,
    IsActive  bit not null default 1,
    CreatedDate datetime2(3) not null default getdate(),
    ModifiedDate datetime2(3),
    index idx_IsActive nonclustered (IsActive)
)
go
insert into Socials(Name,Url,Icon)
values

    ('Github','https://github.com/merveearp','github'),
    ('LinkedIn','https://www.linkedin.com/in/merve-arpac%C4%B1o%C4%9Flu-t%C3%BCrk-8b3917199/','linkedin'),
    ('Medium','https://medium.com','medium'),
    ('X','https://x.com','twitter-x'),
    ('Instagram','https://instagram.com','instagram')

go 

create table Skills(
    Id int primary key identity,
    Name nvarchar(100) not null,
    Rate tinyint not null,
    IsActive bit not null default 1,
    CreatedDate datetime2(3) not null default getdate(),
    ModifiedDate datetime2(3),
    index idx_IsActive nonclustered (IsActive) 

)
go
insert into Skills(Name,Rate)
values 
    ('Html',100),
    ('Css',100),
    ('Asp.Net Core MVC',90),
    ('Asp.Net Core WebAPI',70)
    
go 
create table Services (
    Id int primary key identity,
    Title nvarchar(100) not null,
    Icon nvarchar(100) not null,
    Description nvarchar(1000) not null,
    IsActive bit not null default 1,
    CreatedDate datetime2(3) not null default getdate(),
    ModifiedDate datetime2(3),
    index idx_IsActive nonclustered (IsActive)    
)
go
insert into Services(Title, Icon,Description)
values 
    ('Web Tasarım','bi-activity','İhtiyacınıza uygun web tasarımı'),
    ('Web Uygulama Geliştirme','bi-bounding-box-circles','Özel projeler'),
    ('Ürün Yönetimi','bi-calendar4-week','Profesyonel ürün yönetimi'),
    ('SEO','bi-broadcast','SEO yönetimi')
go

create Table Categories(
    Id int primary key identity,
    Name nvarchar(100) not null,
    IsActive bit not null default 1,
    CreatedDate datetime2(3) not null default getdate(),
    ModifiedDate datetime2(3),
    index idx_IsActive nonclustered (IsActive)    

)
go
insert into Categories(Name)
values('MVC'),('FrondEnd'),('API')
go

create table Projects(
    Id int primary key identity,
    Name nvarchar(100) not null,
    ImageUrl nvarchar(1000) not null,
    Description nvarchar(1000) not null,
    GithubUrl nvarchar(1000),
    ProjectUrl nvarchar(1000),
    ProjectYear int,
    IsActive bit not null default 1,
    CreatedDate datetime2(3) not null default getdate(),
    ModifiedDate datetime2(3),
    CategoryId int not null foreign key references Categories(Id) on delete cascade,
    index idx_IsActive nonclustered (IsActive)

)
go

insert into Projects(Name,ImageUrl,Description,ProjectYear,CategoryId)
values 

('Proje 01','http://localhost:5500/ui/img/projects/project1.jpg','Proje 01 Açıklaması','2023',1),
('Proje 02','http://localhost:5500/ui/img/projects/project2.jpg','Proje 02 Açıklaması','2023',1),
('Proje 03','http://localhost:5500/ui/img/projects/project3.jpg','Proje 03 Açıklaması','2023',2),
('Proje 04','http://localhost:5500/ui/img/projects/project4.jpg','Proje 04 Açıklaması','2023',2),
('Proje 05','http://localhost:5500/ui/img/projects/project3.jpg','Proje 05 Açıklaması','2023',2),
('Proje 06','http://localhost:5500/ui/img/projects/project4.jpg','Proje 06 Açıklaması','2023',2),
('Proje 07','http://localhost:5500/ui/img/projects/project1.jpg','Proje 07 Açıklaması','2023',3),
('Proje 08','http://localhost:5500/ui/img/projects/project2.jpg','Proje 08 Açıklaması','2023',3),
('Proje 09','http://localhost:5500/ui/img/projects/project3.jpg','Proje 09 Açıklaması','2023',3)

create table Contacts(
    Id int primary key identity,
    Name nvarchar(100) not null,
    Email nvarchar(100) not null,
    Subject nvarchar(100) not null,
    Message nvarchar(3000) not null,
    IsRead bit not null default 0,
    SendingTime datetime2(3) not null default getdate(),
    ContactId int null foreign key references Contacts(Id) on delete no action
)
go 
insert into Contacts(Name,Email,Subject,Message)
VALUES  
('Sezen Aksu','sezen@gmail.com','Proje Talebi','Son albüm çalışmam için bir web sitesi yaptırmak istiyorum.'),
('Ali Cabbar','ali@gmail.com','SEO Çalışması','Web sitemin SEO çalışmasını yaptırmak istiyorum.')

go 
insert into Contacts(Name,Email,Subject,Message,ContactId)
values 
('Merve Türk Arpacıoğlu','merveearp@icloud.com','YNT-PROJE','İstediğiniz web sitesi ile teklif ektedir.',1),
('Merve Türk Arpacıoğlu','merveearp@icloud.com','YNT-SEO-ÇALIŞMASI','Kurum olarak seo çalışması yapmıyoruz',2)
go

--Create Triggers tables
--Appsetting
create trigger trg_UpdateModifiedDate_AppSettings
on AppSettings
after update 
as
begin
    update AppSettings
    set ModifiedDate=getDate()
    from AppSettings a 
    inner join inserted i on a.Id=i.Id 
end 
go 

--Socials
create trigger trg_UpdateModifiedDate_Socials
on Socials
after update 
as
begin
    update Socials
    set ModifiedDate=getDate()
    from Socials s
    inner join inserted i on s.Id=i.Id 
end 
go  

--Skills
create trigger trg_UpdateModifiedDate_Skills
on Skills
after update 
as
begin
    update Skills
    set ModifiedDate=getDate()
    from Skills sk 
    inner join inserted i on sk.Id=i.Id 
end 
go  

--Services
create trigger trg_UpdateModifiedDate_Services
on Services
after update 
as
begin
    update Services
    set ModifiedDate=getDate()
    from Services sv 
    inner join inserted i on sv.Id=i.Id 
end 
go  

--Categories
create trigger trg_UpdateModifiedDate_Categories
on Categories
after update 
as
begin
    update Categories
    set ModifiedDate=getDate()
    from Categories c 
    inner join inserted i on c.Id=i.Id 
end 
go

--Projects
create trigger trg_UpdateModifiedDate_Projects
on Projects
after update 
as
begin
    update Projects
    set ModifiedDate=getDate()
    from Projects p 
    inner join inserted i on p.Id=i.Id 
end 
go  