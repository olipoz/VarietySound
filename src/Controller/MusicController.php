<?php

namespace App\Controller;

use App\Entity\Music;
use App\Entity\MusicSearch;
use App\Form\MusicSearchType;
use App\Repository\MusicRepository;
use Doctrine\Persistence\ObjectManager;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class MusicController extends AbstractController
{

    /**
     * @var PropertyRepository
     */
    private $repository;
    /**
     * @var ObjectManager
     */
    private $em;

    public function __construct(MusicRepository $repository)
    {
        $this->repository = $repository;
    }

    /**
     * @route ("/music", name="music.index")
     *
     * @return Response
     */
    public function index(PaginatorInterface $paginator, Request $request): Response
    {

        $search = new MusicSearch();
        $form = $this->createForm(MusicSearchType::class, $search);
        $form->handleRequest($request);

        $musique = $paginator->paginate(
            $this->repository->findAllVisibleQuery($search),
            $request->query->getInt('page', 1),
            5
        );

        return $this->render('music/index.html.twig', [
            'menu_actif' => 'music',
            'music' => $musique,
            'form' => $form->createView()
        ]);
    }

    /**
     * @route ("/ajoutPlaylist/{id}", name="ajoutPlaylist")
     *
     * @return Response
     */
    public function ajoutPlaylist($id) : Response
    {
        $musique = $this->getDoctrine()
        ->getRepository(Music::class)
        ->find($id);

        $user = $this->getUser();

        $em = $this->getDoctrine()->getManager(); 
        $user->addMusic($musique);

        $em->persist($user);
        $em->flush();

        return $this->redirectToRoute('playlist');
    }

    /**
     * @route ("/supprimePlaylist/{id}", name="supprimePlaylist")
     *
     * @param [type] $id
     * @return Response
    */
    public function supprimePlaylist($id) : Response
    {
        $musique = $this->getDoctrine()
        ->getRepository(Music::class)
        ->find($id);

        $user = $this->getUser();

        $em = $this->getDoctrine()->getManager(); 
        $user->removeMusic($musique);

        $em->persist($user);
        $em->flush();

        return $this->redirectToRoute('playlist');
    }
}
