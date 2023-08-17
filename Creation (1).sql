CREATE TABLE login (
    id INTEGER NOT NULL AUTO_INCREMENT,
    userName VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    loginTimeStamp DATETIME(0) NOT NULL,
    counter INTEGER NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE user (
     id INTEGER NOT NULL AUTO_INCREMENT,
     firstName VARCHAR(255) NOT NULL,
     lastName VARCHAR(255) NOT NULL,
     age INTEGER NOT NULL,
     idDocumentType INTEGER NOT NULL,
     documentNumber VARCHAR(255) NOT NULL,
     email VARCHAR(255) NOT NULL,
     address VARCHAR(255) NOT NULL,
     phone VARCHAR(255) NOT NULL,
     idLogin INTEGER NOT NULL,
     createdAt DATETIME(0) NOT NULL DEFAULT NOW(),
     updatedAt DATETIME(0) NOT NULL DEFAULT NOW(),
     UNIQUE(email),
     UNIQUE(idLogin),
     PRIMARY KEY (id),
     CONSTRAINT login_fk_user FOREIGN KEY (idLogin) REFERENCES login (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
     CONSTRAINT documentType_fk_user FOREIGN KEY (idDocumentType) REFERENCES document_type (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE status (
	id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE document_type (
	id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE box (
	id INTEGER NOT NULL AUTO_INCREMENT,
    descrip VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    ref VARCHAR(255) NOT NULL
);
CREATE TABLE rol (
	id INTEGER NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id),
 name VARCHAR(255) NOT NULL
);

CREATE TABLE user_rol (
	id INTEGER NOT NULL AUTO_INCREMENT,
	idUser INTEGER NOT NULL,
    idRol INTEGER NOT NULL,
    PRIMARY KEY (id),
 CONSTRAINT user_fk_rol
     FOREIGN KEY (idUser)
     REFERENCES user (id)
     ON DELETE RESTRICT
     ON UPDATE RESTRICT,
  CONSTRAINT rol_fk_user
     FOREIGN KEY (idRol)
     REFERENCES rol (id)
     ON DELETE RESTRICT
     ON UPDATE RESTRICT
);



CREATE TABLE digital_document (
     id INTEGER NOT NULL AUTO_INCREMENT,
     name VARCHAR(255) NOT NULL,
     descrip VARCHAR(255) NOT NULL,
		file VARCHAR(255) NOT NULL,
     createdAt DATETIME(0) NOT NULL DEFAULT NOW(),
     updatedAt DATETIME(0) NOT NULL DEFAULT NOW(),
    idUser INTEGER NOT NULL ,
    idStatus INTEGER NOT NULL ,
     UNIQUE(file),
     PRIMARY KEY (id),
 CONSTRAINT user_fk_digital_document
     FOREIGN KEY (idUser)
     REFERENCES user (id)
     ON DELETE RESTRICT
     ON UPDATE RESTRICT,
      CONSTRAINT status_fk_digital_document
     FOREIGN KEY (idStatus)
     REFERENCES status (id)
     ON DELETE RESTRICT
     ON UPDATE RESTRICT
);

CREATE TABLE physical_document (
     id INTEGER NOT NULL AUTO_INCREMENT,
     name VARCHAR(255) NOT NULL,
     descrip VARCHAR(255) NOT NULL,
     createdAt DATETIME(0) NOT NULL DEFAULT NOW(),
     updatedAt DATETIME(0) NOT NULL DEFAULT NOW(),
     idBox INTEGER NOT NULL,
    idUser INTEGER NOT NULL,
    idStatus INTEGER NOT NULL,
     PRIMARY KEY (id),
 CONSTRAINT user_fk_physical_document
     FOREIGN KEY (idUser)
     REFERENCES user (id)
     ON DELETE RESTRICT
     ON UPDATE RESTRICT,
      CONSTRAINT status_fk_physical_document
     FOREIGN KEY (idStatus)
     REFERENCES status (id)
     ON DELETE RESTRICT
     ON UPDATE RESTRICT,
      CONSTRAINT box_fk_physical_document
     FOREIGN KEY (idBox)
     REFERENCES box (id)
     ON DELETE RESTRICT
     ON UPDATE RESTRICT
);
CREATE TABLE load_document (
     id INTEGER NOT NULL AUTO_INCREMENT,
     startDate DATE NOT NULL,
     dueDate DATE NOT NULL,
     createdAt DATETIME(0) NOT NULL DEFAULT NOW(),
     updatedAt DATETIME(0) NOT NULL DEFAULT NOW(),
     idPhysicalDocument INTEGER NOT NULL,
    idUser INTEGER NOT NULL ,
    idStatus INTEGER NOT NULL,
     PRIMARY KEY (id),
 CONSTRAINT user_fk_load_document
     FOREIGN KEY (idUser)
     REFERENCES user (id)
     ON DELETE RESTRICT
     ON UPDATE RESTRICT,
      CONSTRAINT status_fk_load_document
     FOREIGN KEY (idStatus)
     REFERENCES status (id)
     ON DELETE RESTRICT
     ON UPDATE RESTRICT,
      CONSTRAINT physical_document_fk_load_document
     FOREIGN KEY (idPhysicalDocument)
     REFERENCES physical_document (id)
     ON DELETE RESTRICT
     ON UPDATE RESTRICT
);
CREATE TABLE download_document (
     id INTEGER NOT NULL AUTO_INCREMENT,
     createdAt DATETIME(0) NOT NULL DEFAULT NOW(),
     updatedAt DATETIME(0) NOT NULL DEFAULT NOW(),
     idDigitalDocument INTEGER NOT NULL,
    idUser INTEGER NOT NULL ,
     PRIMARY KEY (id),
 CONSTRAINT user_fk_download_document
     FOREIGN KEY (idUser)
     REFERENCES user (id)
     ON DELETE RESTRICT
     ON UPDATE RESTRICT,
      CONSTRAINT digital_document_fk_download_document
     FOREIGN KEY (idDigitalDocument)
     REFERENCES  digital_document (id)
     ON DELETE RESTRICT
     ON UPDATE RESTRICT
);



