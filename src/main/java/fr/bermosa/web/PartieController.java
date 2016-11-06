package fr.bermosa.web;
import fr.bermosa.domain.Partie;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/parties")
@Controller
@RooWebScaffold(path = "parties", formBackingObject = Partie.class)
public class PartieController {
}
