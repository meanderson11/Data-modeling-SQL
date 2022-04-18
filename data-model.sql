CREATE TABLE "public.Access" (
	"user_id" serial NOT NULL,
	"email" varchar(255) NOT NULL,
	"password" varchar(255) NOT NULL,
	"DOB" DATE NOT NULL,
	"phone_number" varchar(12) NOT NULL,
	CONSTRAINT "Access_pk" PRIMARY KEY ("user_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Users" (
	"user_id" serial NOT NULL,
	"username" varchar(20) NOT NULL UNIQUE,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	"picture" TEXT NOT NULL,
	CONSTRAINT "Users_pk" PRIMARY KEY ("user_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Likes" (
	"like_id" integer NOT NULL,
	"user_id" integer NOT NULL,
	"recipe_id" integer NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Loves" (
	"love_id" integer NOT NULL,
	"user_id" integer NOT NULL,
	"recipe_id" integer NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Dislikes" (
	"dislike_id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"recipe_id" integer NOT NULL,
	CONSTRAINT "Dislikes_pk" PRIMARY KEY ("dislike_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Comments" (
	"comment_id" serial NOT NULL,
	"comment_body" varchar(255) NOT NULL,
	"user_id" integer NOT NULL,
	"recipe_id" integer NOT NULL,
	CONSTRAINT "Comments_pk" PRIMARY KEY ("comment_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Grocery List" (
	"grocery_list_id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"date_created" DATE NOT NULL,
	"ingredient_list_id" integer NOT NULL,
	"quantity" FLOAT NOT NULL,
	CONSTRAINT "Grocery List_pk" PRIMARY KEY ("grocery_list_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Recipes" (
	"user_id" serial NOT NULL,
	"recipe_id" integer NOT NULL,
	"date_posted" DATETIME NOT NULL,
	"recipe_content" TEXT NOT NULL,
	"recipe_instructions" TEXT NOT NULL,
	"private" BOOLEAN NOT NULL,
	"occasion_id" integer NOT NULL,
	"picture*?" TEXT NOT NULL,
	"rating*?" integer(5) NOT NULL,
	CONSTRAINT "Recipes_pk" PRIMARY KEY ("user_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Ingredient List" (
	"recipe_id" integer NOT NULL,
	"list_id" integer NOT NULL,
	"ingredient_id" integer NOT NULL,
	"quantity" FLOAT NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Ingredients" (
	"ingredient_id" serial NOT NULL,
	"ingredient_name" varchar(40) NOT NULL,
	"price" FLOAT NOT NULL,
	CONSTRAINT "Ingredients_pk" PRIMARY KEY ("ingredient_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.occasions" (
	"creator" serial NOT NULL,
	"occasion_id" integer NOT NULL,
	"name" varchar(255) NOT NULL,
	"date_start" DATE NOT NULL,
	"date_end" DATE NOT NULL,
	CONSTRAINT "occasions_pk" PRIMARY KEY ("creator")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "Access" ADD CONSTRAINT "Access_fk0" FOREIGN KEY ("user_id") REFERENCES "Users"("user_id");


ALTER TABLE "Likes" ADD CONSTRAINT "Likes_fk0" FOREIGN KEY ("user_id") REFERENCES "Users"("user_id");
ALTER TABLE "Likes" ADD CONSTRAINT "Likes_fk1" FOREIGN KEY ("recipe_id") REFERENCES "Recipes"("recipe_id");

ALTER TABLE "Loves" ADD CONSTRAINT "Loves_fk0" FOREIGN KEY ("user_id") REFERENCES "Users"("user_id");
ALTER TABLE "Loves" ADD CONSTRAINT "Loves_fk1" FOREIGN KEY ("recipe_id") REFERENCES "Recipes"("recipe_id");

ALTER TABLE "Dislikes" ADD CONSTRAINT "Dislikes_fk0" FOREIGN KEY ("user_id") REFERENCES "Users"("user_id");
ALTER TABLE "Dislikes" ADD CONSTRAINT "Dislikes_fk1" FOREIGN KEY ("recipe_id") REFERENCES "Recipes"("recipe_id");

ALTER TABLE "Comments" ADD CONSTRAINT "Comments_fk0" FOREIGN KEY ("user_id") REFERENCES "Users"("user_id");
ALTER TABLE "Comments" ADD CONSTRAINT "Comments_fk1" FOREIGN KEY ("recipe_id") REFERENCES "Recipes"("recipe_id");

ALTER TABLE "Grocery List" ADD CONSTRAINT "Grocery List_fk0" FOREIGN KEY ("user_id") REFERENCES "Users"("user_id");
ALTER TABLE "Grocery List" ADD CONSTRAINT "Grocery List_fk1" FOREIGN KEY ("ingredient_list_id") REFERENCES "Ingredient List"("list_id");

ALTER TABLE "Recipes" ADD CONSTRAINT "Recipes_fk0" FOREIGN KEY ("user_id") REFERENCES "Users"("user_id");

ALTER TABLE "Ingredient List" ADD CONSTRAINT "Ingredient List_fk0" FOREIGN KEY ("recipe_id") REFERENCES "Recipes"("user_id");
ALTER TABLE "Ingredient List" ADD CONSTRAINT "Ingredient List_fk1" FOREIGN KEY ("list_id") REFERENCES "Ingredients"("");
ALTER TABLE "Ingredient List" ADD CONSTRAINT "Ingredient List_fk2" FOREIGN KEY ("ingredient_id") REFERENCES "Ingredients"("ingredient_id");


ALTER TABLE "occasions" ADD CONSTRAINT "occasions_fk0" FOREIGN KEY ("creator") REFERENCES "Users"("user_id");
ALTER TABLE "occasions" ADD CONSTRAINT "occasions_fk1" FOREIGN KEY ("occasion_id") REFERENCES "Recipes"("occasion_id");











