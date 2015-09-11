class Xml < ActiveRecord::Base
	has_many :tracksegments, :dependent => :destroy
	has_many :dados, :through => :tracksegments


	has_attached_file :gpx
  before_save :parse_file
  validates_attachment_file_name :gpx, matches: [/xml\Z/]



  def parse_file
    tempfile = gpx.queued_for_write[:original]
    doc = Nokogiri::XML(tempfile)
    parse_xml(doc)
  end

  def parse_xml(doc)
    doc.root.elements.each do |node|
      parse_tracks(node)
    end
  end

  def parse_tracks(node)
    if node.node_name.eql? 'capture'
      node.elements.each do |node|
        parse_track_segments(node)
      end
    end
  end

def parse_track_segments(node)
    if node.node_name.eql? 'bbmessenger'
      tmp_segment = Tracksegment.new
      node.elements.each do |node|
        parse_points(node,tmp_segment)
      end
      self.tracksegments << tmp_segment
    end
  end


  def parse_points(node,tmp_segment)
    if node.node_name.eql? 'message'
      tmp_point = Dado.new

      node.elements.each do |node|
      tmp_point.nome = node.text.to_s if node.name.eql? 'name'
      tmp_point.origem = node.text.to_s if node.name.eql? 'contacts'
      tmp_point.destino = node.text.to_s if node.name.eql? 'name'
      tmp_point.mensagem = node.text.to_s if node.name.eql? 'text'
      tmp_point.hora = node.text.to_s if node.name.eql? '--'
      
      end
      tmp_segment.dados << tmp_point
    end

end






end
