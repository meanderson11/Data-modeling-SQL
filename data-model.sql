CREATE TABLE "public.Access" (
	"user_id" serial NOT NULL,
	"email" varchar(255) NOT NULL,
	"password" varchar(255) NOT NULL,
	"DOB" DATE NOT NULL,
	"phone_number" varchar(12) NOT NULL,
	CONSTRAINT "Access_pk" PRIMARY KEY ("user_id")
); 




CREATE TABLE "public.Users" (
	"user_id" serial NOT NULL,
	"username" varchar(20) NOT NULL UNIQUE,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	"picture" TEXT NOT NULL,
	CONSTRAINT "Users_pk" PRIMARY KEY ("user_id")
);



CREATE TABLE "public.Likes" (
	"like_id" integer NOT NULL,
	"user_id" integer NOT NULL,
	"recipe_id" integer NOT NULL
);



CREATE TABLE "public.Loves" (
	"love_id" integer NOT NULL,
	"user_id" integer NOT NULL,
	"recipe_id" integer NOT NULL
);



CREATE TABLE "public.Dislikes" (
	"dislike_id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"recipe_id" integer NOT NULL,
	CONSTRAINT "Dislikes_pk" PRIMARY KEY ("dislike_id")
);



CREATE TABLE "public.Comments" (
	"comment_id" serial NOT NULL,
	"comment_body" varchar(255) NOT NULL,
	"user_id" integer NOT NULL,
	"recipe_id" integer NOT NULL,
	CONSTRAINT "Comments_pk" PRIMARY KEY ("comment_id")
);


CREATE TABLE "public.Grocery List" (
	"grocery_list_id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"date_created" DATE NOT NULL,
	"ingredient_list_id" integer NOT NULL,
	"quantity" FLOAT NOT NULL,
	CONSTRAINT "Grocery List_pk" PRIMARY KEY ("grocery_list_id")
);



CREATE TABLE "public.Recipes" (
	"user_id" serial NOT NULL,
	"recipe_id" integer NOT NULL,
	"date_posted" timestamp NOT NULL,
	"recipe_content" TEXT NOT NULL,
	"recipe_instructions" TEXT NOT NULL,
	"private" BOOLEAN NOT NULL,
	"occasion_id" integer NOT NULL,
	"picture" TEXT NOT NULL,
	"rating" integer NOT NULL,
	CONSTRAINT "Recipes_pk" PRIMARY KEY ("user_id")
); 


CREATE TABLE "public.Ingredient List" (
	"recipe_id" integer NOT NULL,
	"list_id" integer NOT NULL,
	"ingredient_id" integer NOT NULL,
	"quantity" FLOAT NOT NULL
);



CREATE TABLE "public.Ingredients" (
	"ingredient_id" serial NOT NULL,
	"ingredient_name" varchar(40) NOT NULL,
	"price" FLOAT NOT NULL,
	CONSTRAINT "Ingredients_pk" PRIMARY KEY ("ingredient_id")
);



CREATE TABLE "public.occasions" (
	"creator" serial NOT NULL,
	"occasion_id" integer NOT NULL,
	"name" varchar(255) NOT NULL,
	"date_start" DATE NOT NULL,
	"date_end" DATE NOT NULL,
	CONSTRAINT "occasions_pk" PRIMARY KEY ("creator")
);









