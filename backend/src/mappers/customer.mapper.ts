import { Customer } from '../types/domain';

type CustomerRow = Record<string, any>;
type CustomerInsert = Record<string, any>;
type CustomerUpdate = Record<string, any>;

export function toCustomerDomain(row: CustomerRow): Customer {
  return {
    id: row.id,
    name: row.name,
    phone: row.phone,
    email: row.email,
    address: row.address,
    creditLimit: row.credit_limit,
    creditUsed: row.credit_used,
    personType: (row.person_type ?? 'PF') as Customer['personType'],
    document: row.document ?? null,
    legalName: row.legal_name ?? null,
    stateRegistration: row.state_registration ?? null,
    fiscalZipCode: row.fiscal_zip_code ?? null,
    fiscalStreet: row.fiscal_street ?? null,
    fiscalNumber: row.fiscal_number ?? null,
    fiscalNeighborhood: row.fiscal_neighborhood ?? null,
    fiscalCity: row.fiscal_city ?? null,
    fiscalCityIbgeCode: row.fiscal_city_ibge_code ?? null,
    fiscalState: row.fiscal_state ?? null,
    createdAt: new Date(row.created_at),
    updatedAt: new Date(row.updated_at),
  };
}

export function toCustomerInsert(domain: Customer): CustomerInsert {
  return {
    id: domain.id,
    name: domain.name,
    phone: domain.phone,
    email: domain.email,
    address: domain.address,
    credit_limit: domain.creditLimit,
    credit_used: domain.creditUsed,
    person_type: domain.personType,
    document: domain.document,
    legal_name: domain.legalName,
    state_registration: domain.stateRegistration,
    fiscal_zip_code: domain.fiscalZipCode,
    fiscal_street: domain.fiscalStreet,
    fiscal_number: domain.fiscalNumber,
    fiscal_neighborhood: domain.fiscalNeighborhood,
    fiscal_city: domain.fiscalCity,
    fiscal_city_ibge_code: domain.fiscalCityIbgeCode,
    fiscal_state: domain.fiscalState,
  };
}

export function toCustomerUpdate(patch: Partial<Customer>): CustomerUpdate {
  const update: CustomerUpdate = {};
  if (patch.name !== undefined) update.name = patch.name;
  if (patch.phone !== undefined) update.phone = patch.phone;
  if (patch.email !== undefined) update.email = patch.email;
  if (patch.address !== undefined) update.address = patch.address;
  if (patch.creditLimit !== undefined) update.credit_limit = patch.creditLimit;
  if (patch.creditUsed !== undefined) update.credit_used = patch.creditUsed;
  if (patch.personType !== undefined) update.person_type = patch.personType;
  if (patch.document !== undefined) update.document = patch.document;
  if (patch.legalName !== undefined) update.legal_name = patch.legalName;
  if (patch.stateRegistration !== undefined) update.state_registration = patch.stateRegistration;
  if (patch.fiscalZipCode !== undefined) update.fiscal_zip_code = patch.fiscalZipCode;
  if (patch.fiscalStreet !== undefined) update.fiscal_street = patch.fiscalStreet;
  if (patch.fiscalNumber !== undefined) update.fiscal_number = patch.fiscalNumber;
  if (patch.fiscalNeighborhood !== undefined) update.fiscal_neighborhood = patch.fiscalNeighborhood;
  if (patch.fiscalCity !== undefined) update.fiscal_city = patch.fiscalCity;
  if (patch.fiscalCityIbgeCode !== undefined) update.fiscal_city_ibge_code = patch.fiscalCityIbgeCode;
  if (patch.fiscalState !== undefined) update.fiscal_state = patch.fiscalState;
  return update;
}
