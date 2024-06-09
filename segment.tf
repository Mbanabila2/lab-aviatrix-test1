resource "aviatrix_segmentation_network_domain" "domain1" {
  domain_name = "blue"
}
resource "aviatrix_segmentation_network_domain" "domain2" {
  domain_name = "brown"
}

resource "aviatrix_segmentation_network_domain_association" "domain1link1" {
  network_domain_name = aviatrix_segmentation_network_domain.domain1.domain_name
  attachment_name     = aviatrix_spoke_gateway.spoke1.gw_name
}
resource "aviatrix_segmentation_network_domain_association" "domain2link2" {
  network_domain_name = aviatrix_segmentation_network_domain.domain2.domain_name
  attachment_name     = aviatrix_spoke_gateway.spoke2.gw_name
}

resource "aviatrix_segmentation_network_domain_connection_policy" "policy1connection1" {
  domain_name_1 = aviatrix_segmentation_network_domain.domain1.domain_name
  domain_name_2 = aviatrix_segmentation_network_domain.domain2.domain_name
}