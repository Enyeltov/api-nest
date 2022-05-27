-- CreateEnum
CREATE TYPE "genders" AS ENUM ('male', 'female', 'others');

-- CreateEnum
CREATE TYPE "entitiablenum" AS ENUM ('Companies', 'Clients');

-- CreateEnum
CREATE TYPE "userroles" AS ENUM ('admin', 'digitalizer', 'dummy');

-- CreateTable
CREATE TABLE "Addresses" (
    "id" SERIAL NOT NULL,
    "cityId" INTEGER NOT NULL,
    "street" VARCHAR(255),
    "residence" VARCHAR(255),
    "GPS" VARCHAR(255),
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "Addresses_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Agents" (
    "id" SERIAL NOT NULL,
    "personId" INTEGER NOT NULL,
    "AgenciesId" INTEGER,
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "Agents_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClientHasAgents" (
    "id" SERIAL NOT NULL,
    "clientId" INTEGER,
    "agentId" INTEGER,
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "ClientHasAgents_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClientHasTomadors" (
    "id" SERIAL NOT NULL,
    "clientPolizaId" INTEGER,
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "ClientHasTomadors_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Clients" (
    "id" SERIAL NOT NULL,
    "personId" INTEGER NOT NULL,
    "civilPolicyStatus" VARCHAR(255),
    "company" VARCHAR(255),
    "ocupation" VARCHAR(255),
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "Clients_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Configs" (
    "id" SERIAL NOT NULL,
    "key" VARCHAR(255) NOT NULL,
    "value" VARCHAR(255) NOT NULL,
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "Configs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InsuranceCarriers" (
    "id" SERIAL NOT NULL,
    "document" INTEGER,
    "name" VARCHAR(255),
    "phone" VARCHAR(255),
    "email" VARCHAR(255),
    "account" VARCHAR(255),
    "paymentLink" VARCHAR(255),
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "InsuranceCarriers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OrderDetails" (
    "id" SERIAL NOT NULL,
    "ClientHasTomadorId" INTEGER NOT NULL,
    "periodicityId" INTEGER NOT NULL,
    "primeValue" DOUBLE PRECISION,
    "taxes" DOUBLE PRECISION,
    "AnnexValue" DOUBLE PRECISION,
    "comission" DOUBLE PRECISION,
    "comissionPolicyStatus" BOOLEAN,
    "ValorFinalizacion" DOUBLE PRECISION,
    "Total" DOUBLE PRECISION,
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "OrderDetails_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Patrimonials" (
    "id" SERIAL NOT NULL,
    "policyId" INTEGER NOT NULL,
    "type" VARCHAR(255) NOT NULL,
    "totalValue" DOUBLE PRECISION,
    "machineryValue" DOUBLE PRECISION,
    "furnitureValue" DOUBLE PRECISION,
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "Patrimonials_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Payments" (
    "id" SERIAL NOT NULL,
    "orderDetailsId" INTEGER NOT NULL,
    "receiptNumber" DOUBLE PRECISION,
    "paymentValue" DOUBLE PRECISION,
    "paymentDate" DATE,
    "comissionDate" DATE,
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "Payments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Periods" (
    "id" SERIAL NOT NULL,
    "policyId" INTEGER,
    "startDate" DATE NOT NULL,
    "endDate" DATE NOT NULL,
    "renewal" INTEGER,
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "Periods_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Persons" (
    "id" SERIAL NOT NULL,
    "documentTypeId" INTEGER,
    "document" INTEGER,
    "AddressId" INTEGER,
    "gender" "genders",
    "name" VARCHAR(255) NOT NULL,
    "lastName" VARCHAR(255) NOT NULL,
    "birthDate" DATE,
    "phone" VARCHAR(255),
    "email" VARCHAR(255) NOT NULL,
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "Persons_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PolicyStatus" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),
    "description" VARCHAR(255),
    "policystatusName" VARCHAR(255) NOT NULL,

    CONSTRAINT "PolicyStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RelationPolicyStatus" (
    "id" SERIAL NOT NULL,
    "relationName" VARCHAR(255) NOT NULL,
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "RelationPolicyStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Travels" (
    "id" SERIAL NOT NULL,
    "startCountry" INTEGER NOT NULL,
    "endCountry" INTEGER NOT NULL,
    "policyId" INTEGER NOT NULL,
    "startDate" DATE NOT NULL,
    "endDate" DATE NOT NULL,
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "Travels_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Users" (
    "id" SERIAL NOT NULL,
    "userRole" "userroles",
    "hashedPassword" TEXT NOT NULL,
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "Users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Vehicles" (
    "id" SERIAL NOT NULL,
    "policyId" INTEGER NOT NULL,
    "brand" VARCHAR(255) NOT NULL,
    "class" VARCHAR(255),
    "model" VARCHAR(255),
    "vehicleType" VARCHAR(255),
    "serviceType" VARCHAR(255),
    "gasConverted" VARCHAR(255),
    "vehicleAge" INTEGER,
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "Vehicles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BranchTypes" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "BranchTypes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Continents" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "Continents_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CountryStates" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),
    "countryId" INTEGER NOT NULL,

    CONSTRAINT "CountryStates_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SubBranchs" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "branchTypeId" INTEGER,
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "SubBranchs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Taxes" (
    "id" SERIAL NOT NULL,
    "OrderDetailsId" INTEGER NOT NULL,
    "metakey" VARCHAR(255) NOT NULL,
    "metavalue" VARCHAR(255) NOT NULL,
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "Taxes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Agencies" (
    "id" SERIAL NOT NULL,
    "document" INTEGER,
    "name" VARCHAR(255),
    "phone" VARCHAR(255),
    "email" VARCHAR(255),
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),

    CONSTRAINT "Agencies_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cities" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "countryStateId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "Cities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Companies" (
    "id" SERIAL NOT NULL,
    "document" INTEGER NOT NULL,
    "socialReason" VARCHAR(255),
    "economicActivity" VARCHAR(255),
    "webPage" VARCHAR(255),
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "Companies_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Countries" (
    "id" SERIAL NOT NULL,
    "continentId" INTEGER NOT NULL,
    "countryName" VARCHAR(255) NOT NULL,
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "Countries_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DocumentTypes" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "DocumentTypes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Periodicities" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "Periodicities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Policies" (
    "id" SERIAL NOT NULL,
    "InsuranceCarrierId" INTEGER NOT NULL,
    "policyNum" DOUBLE PRECISION NOT NULL,
    "policyStatusId" INTEGER NOT NULL,
    "Risk" VARCHAR(255) NOT NULL,
    "branchTypeId" INTEGER NOT NULL,
    "subBranchId" INTEGER NOT NULL,
    "insuredValue" DOUBLE PRECISION,
    "Renovable" BOOLEAN NOT NULL,
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "Policies_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AgentContracts" (
    "id" SERIAL NOT NULL,
    "policyId" INTEGER,
    "agentId" INTEGER,
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "AgentContracts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EntitiesHasPolizas" (
    "id" SERIAL NOT NULL,
    "policyId" INTEGER,
    "entitiableTypes" "entitiablenum" NOT NULL,
    "entitiableId" INTEGER,
    "relationId" INTEGER,
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "EntitiesHasPolizas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Notifications" (
    "id" SERIAL NOT NULL,
    "type" VARCHAR(255),
    "clientId" INTEGER,
    "notifiableType" VARCHAR(255),
    "notifiableId" INTEGER,
    "data" TEXT,
    "readAt" TIMESTAMP(6),
    "createdAt" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdBy" VARCHAR(255),
    "updatedAt" TIMESTAMP(6),
    "updatedBy" VARCHAR(255),
    "softDeletedAt" TIMESTAMP(6),
    "softDeletedBy" VARCHAR(255),

    CONSTRAINT "Notifications_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Persons_email_key" ON "Persons"("email");

-- AddForeignKey
ALTER TABLE "Addresses" ADD CONSTRAINT "Addresses_cityId_fkey" FOREIGN KEY ("cityId") REFERENCES "Cities"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Agents" ADD CONSTRAINT "Agents_personId_fkey" FOREIGN KEY ("personId") REFERENCES "Persons"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Agents" ADD CONSTRAINT "Agents_AgenciesId_fkey" FOREIGN KEY ("AgenciesId") REFERENCES "Agencies"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ClientHasAgents" ADD CONSTRAINT "ClientHasAgents_agentId_fkey" FOREIGN KEY ("agentId") REFERENCES "Agents"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ClientHasAgents" ADD CONSTRAINT "ClientHasAgents_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "Clients"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ClientHasTomadors" ADD CONSTRAINT "ClientHasTomadors_clientPolizaId_fkey" FOREIGN KEY ("clientPolizaId") REFERENCES "EntitiesHasPolizas"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Clients" ADD CONSTRAINT "Clients_personId_fkey" FOREIGN KEY ("personId") REFERENCES "Persons"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "OrderDetails" ADD CONSTRAINT "OrderDetails_ClientHasTomadorId_fkey" FOREIGN KEY ("ClientHasTomadorId") REFERENCES "ClientHasTomadors"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "OrderDetails" ADD CONSTRAINT "OrderDetails_periodicityId_fkey" FOREIGN KEY ("periodicityId") REFERENCES "Periodicities"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Patrimonials" ADD CONSTRAINT "Patrimonials_policyId_fkey" FOREIGN KEY ("policyId") REFERENCES "Policies"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Payments" ADD CONSTRAINT "Payments_orderDetailsId_fkey" FOREIGN KEY ("orderDetailsId") REFERENCES "OrderDetails"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Periods" ADD CONSTRAINT "Periods_policyId_fkey" FOREIGN KEY ("policyId") REFERENCES "Policies"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Persons" ADD CONSTRAINT "Persons_AddressId_fkey" FOREIGN KEY ("AddressId") REFERENCES "Addresses"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Persons" ADD CONSTRAINT "Persons_documentTypeId_fkey" FOREIGN KEY ("documentTypeId") REFERENCES "DocumentTypes"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Travels" ADD CONSTRAINT "Travels_endCountry_fkey" FOREIGN KEY ("endCountry") REFERENCES "Countries"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Travels" ADD CONSTRAINT "Travels_startCountry_fkey" FOREIGN KEY ("startCountry") REFERENCES "Countries"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Travels" ADD CONSTRAINT "Travels_policyId_fkey" FOREIGN KEY ("policyId") REFERENCES "Policies"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Users" ADD CONSTRAINT "Users_id_fkey" FOREIGN KEY ("id") REFERENCES "Persons"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Vehicles" ADD CONSTRAINT "Vehicles_policyId_fkey" FOREIGN KEY ("policyId") REFERENCES "Policies"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "CountryStates" ADD CONSTRAINT "CountryStates_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES "Countries"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "SubBranchs" ADD CONSTRAINT "SubBranchs_branchTypeId_fkey" FOREIGN KEY ("branchTypeId") REFERENCES "BranchTypes"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Taxes" ADD CONSTRAINT "Taxes_OrderDetailsId_fkey" FOREIGN KEY ("OrderDetailsId") REFERENCES "OrderDetails"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Cities" ADD CONSTRAINT "Cities_countryStateId_fkey" FOREIGN KEY ("countryStateId") REFERENCES "CountryStates"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Countries" ADD CONSTRAINT "Countries_continentId_fkey" FOREIGN KEY ("continentId") REFERENCES "Continents"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Policies" ADD CONSTRAINT "Policies_InsuranceCarrierId_fkey" FOREIGN KEY ("InsuranceCarrierId") REFERENCES "InsuranceCarriers"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Policies" ADD CONSTRAINT "Policies_policyStatusId_fkey" FOREIGN KEY ("policyStatusId") REFERENCES "PolicyStatus"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Policies" ADD CONSTRAINT "Policies_branchTypeId_fkey" FOREIGN KEY ("branchTypeId") REFERENCES "BranchTypes"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Policies" ADD CONSTRAINT "Policies_subBranchId_fkey" FOREIGN KEY ("subBranchId") REFERENCES "SubBranchs"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "AgentContracts" ADD CONSTRAINT "AgentContracts_agentId_fkey" FOREIGN KEY ("agentId") REFERENCES "Agents"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "AgentContracts" ADD CONSTRAINT "AgentContracts_policyId_fkey" FOREIGN KEY ("policyId") REFERENCES "Policies"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "EntitiesHasPolizas" ADD CONSTRAINT "EntitiesHasPolizas_relationId_fkey" FOREIGN KEY ("relationId") REFERENCES "RelationPolicyStatus"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "EntitiesHasPolizas" ADD CONSTRAINT "EntitiesHasPolizas_policyId_fkey" FOREIGN KEY ("policyId") REFERENCES "Policies"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Notifications" ADD CONSTRAINT "Notifications_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "Clients"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;