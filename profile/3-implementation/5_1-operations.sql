-- Create AstroBookings Operations Schema

-- Drop existing tables
DROP TABLE IF EXISTS notifications CASCADE;
DROP TABLE IF EXISTS templates CASCADE;
DROP TABLE IF EXISTS payments CASCADE;
DROP TABLE IF EXISTS invoices CASCADE;
DROP TABLE IF EXISTS bookings CASCADE;
DROP TABLE IF EXISTS launches CASCADE;
DROP TABLE IF EXISTS rockets CASCADE;
DROP TABLE IF EXISTS agencies CASCADE;
DROP TABLE IF EXISTS travelers CASCADE;

-- Travelers Table
CREATE TABLE IF NOT EXISTS travelers (
  user_id TEXT PRIMARY KEY,
  contact_phone TEXT,
  emergency_contact TEXT,
  travel_preferences JSON
);

-- Agencies Table
CREATE TABLE IF NOT EXISTS agencies (
  user_id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT,
  tax_id TEXT NOT NULL,
  address TEXT NOT NULL,
  contact_info TEXT
);

-- Rockets Table
CREATE TABLE IF NOT EXISTS rockets (
  id TEXT PRIMARY KEY DEFAULT gen_random_uuid(),
  agency_id TEXT NOT NULL REFERENCES agencies(user_id),
  name TEXT NOT NULL,
  capacity INT DEFAULT 8,
  range TEXT CHECK (range IN ('low-earth-orbit', 'geostationary', 'interplanetary'))
);

-- Launches Table
CREATE TABLE IF NOT EXISTS launches (
  id TEXT PRIMARY KEY DEFAULT gen_random_uuid(),
  agency_id TEXT NOT NULL REFERENCES agencies(user_id),
  rocket_id TEXT NOT NULL REFERENCES rockets(id),
  launch_on DATE NOT NULL,
  destination TEXT NOT NULL,
  price_per_seat NUMERIC NOT NULL,
  status TEXT CHECK (status IN ('scheduled', 'launched', 'aborted'))
);

-- Bookings Table
CREATE TABLE bookings (
  id TEXT PRIMARY KEY DEFAULT gen_random_uuid(),
  traveler_id TEXT NOT NULL REFERENCES travelers(user_id),
  launch_id TEXT NOT NULL REFERENCES launches(id),
  number_of_seats INT DEFAULT 1,
  booked_at TIMESTAMP DEFAULT NOW(),
  status TEXT CHECK (status IN('reserved', 'cancelled', 'launched', 'aborted'))
);

-- Invoices Table
CREATE TABLE invoices (
  id TEXT PRIMARY KEY DEFAULT gen_random_uuid(),
  agency_id TEXT REFERENCES agencies(user_id),
  launch_id TEXT REFERENCES launches(id),
  amount NUMERIC NOT NULL,
  legal_number TEXT NOT NULL,
  issued_on DATE DEFAULT NOW(),
  status TEXT CHECK (status IN ('pending', 'paid', 'cancelled'))
);

-- Payments Table
CREATE TABLE payments (
  id TEXT PRIMARY KEY DEFAULT gen_random_uuid(),
  invoice_id TEXT NOT NULL REFERENCES invoices(id),
  amount NUMERIC,
  paid_on DATE DEFAULT NOW(),
  status TEXT CHECK (status IN ('paid', 'failed'))
);

-- Templates Table
CREATE TABLE templates (
  id TEXT PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  subject TEXT NOT NULL,
  message TEXT NOT NULL
);

-- Notifications Table
CREATE TABLE notifications (
  id TEXT PRIMARY KEY DEFAULT gen_random_uuid(),
  template_id TEXT NOT NULL REFERENCES templates(id),
  agency_id TEXT REFERENCES agencies(user_id),
  launch_id TEXT REFERENCES launches(id),
  traveler_id TEXT REFERENCES travelers(user_id),
  booking_id TEXT REFERENCES bookings(id),
  invoice_id TEXT REFERENCES invoices(id),
  recipient_email TEXT NOT NULL,
  subject TEXT NOT NULL,
  message TEXT NOT NULL,
  timestamp TIMESTAMP DEFAULT NOW(),
  status TEXT CHECK (status IN ('pending', 'read', 'sent', 'failed'))
);