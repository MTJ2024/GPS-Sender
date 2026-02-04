-- GPS Tracker Items - Datenbank Import
-- Führe dieses SQL in deiner Datenbank aus

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('gps_tracker_1h', 'GPS-Tracker 1 Stunde', 200, 0, 1),
('gps_tracker_24h', 'GPS-Tracker 24 Stunden', 250, 0, 1),
('gps_tracker_permanent', 'GPS-Tracker Permanent', 300, 0, 1),
('gps_remover', 'GPS Remover Tool', 180, 0, 1);
