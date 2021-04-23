class Doctor
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select {|apt| apt.doctor == self}
    end

    def new_appointment(date, patient)
        Appointment.new(date, patient, self)
    end

    def patients
        appointments.map {|apt| apt.patient}
    end
end