<?php
namespace Zoom;
require_once __DIR__ . '/config.php';
use Zoom\Endpoint\Users;
use Zoom\Endpoint\Meetings;

class ZoomAPI{

	/**
	 * @var null
	 */
	private $apiKey = null;

	/**
	 * @var null
	 */
	private $apiSecret = null;

	/**
	 * @var null
	 */
	private $users = null;
	private $meetings = null;


	/**
	 * Retorna uma instância única de uma classe.
	 *
	 * @staticvar Singleton $instance A instância única dessa classe.
	 *
	 * @return Singleton A Instância única.
	 */
	public function getInstance()
	{
		static $users = null;
		static $meetings = null;
		if (null === $users) {
			$this->users = new Users($this->apiKey, $this->apiSecret);
		}
		if (null === $meetings) {
			$this->meetings = new Meetings($this->apiKey, $this->apiSecret);
		}

		//return $users;
	}

	/**
	 * Zoom constructor.
	 * @param $apiKey
	 * @param $apiSecret
	 */
	public function __construct( $apiKey, $apiSecret )
	{

		$this->apiKey = $apiKey;

		$this->apiSecret = $apiSecret;

		$this->getInstance();

	}


	/*Functions for management of users*/

	public function createUser()
	{
		$user_info->email = "jindal.asheesh@gmail.com";
		$user_info->type = 1;
		$user_info->first_name = "Ashish";
		$user_info->last_name = "Kumar";

		$createAUserArray['action'] = 'create';
		$createAUserArray['email'] = "jindal.asheesh@gmail.com";
		$createAUserArray['user_info'] = $user_info;

		return $this->users->create($createAUserArray);
	}

	public function listUsers()
	{
		return $this->users->list();
	}	

	public function listMeetings($query=[])
	{
		return $this->meetings->list(AUTH_USER,$query);
	}		

	public function createMeeting($data)
	{
		return $this->meetings->create(AUTH_USER,$data);	
	}

	public function updateMeeting($meetingId,$data=[])
	{
		return $this->meetings->update($meetingId,$data);	
	}

	public function getMeeting($meetingId)
	{
		return $this->meetings->meeting($meetingId);	
	}

	public function addRegistrant($meetingId,$data=[])
	{
		return $this->meetings->addRegistrant($meetingId,$data);
	}

	public function getRegisteredUserList($meetingId,$query=[])
	{
		return $this->meetings->listRegistrants($meetingId,$query);
	}
}